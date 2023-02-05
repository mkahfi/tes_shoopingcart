require([
    "esri/Map",
    "esri/layers/FeatureLayer",
    "esri/views/MapView",
    "esri/PopupTemplate",
    "esri/widgets/ScaleBar"
], function(Map, FeatureLayer, MapView, PopupTemplate, ScaleBar) {
    

 
    /******************************************************************
     *
     * Add featurelayers to the map example
     *
     ******************************************************************/

    /******************************************************************
     *
     * Popup example
     *
     ******************************************************************/

    // alert('load BM Maps');
        // Template untuk popup ketika feature layer diklik pada map
    let popupTemplate = new PopupTemplate({
            title: "Ruas Jalan",
            content: [{
                // Specify the type of popup element - fields
                type: "fields",
                fieldInfos: [
                    {
                        fieldName: "LINK_NAME",
                        visible: true,
                        label: "Nama Ruas"
                    },
                    {
                        fieldName: "REAL_LENGTH",
                        visible: true,
                        label: "Panjang (km)"
                    },
                    {
                        fieldName: "START_POINT_IDENTIFIER",
                        visible: true,
                        label: "Titik Awal"
                    },
                    {
                        fieldName: "END_POINT_IDENTIFIER",
                        visible: true,
                        label: "Titik Akhir"
                    }
                ]
            },
            ]
        });

    // Ruas jalan yang akan ditampilkan pada map
    let ruas_jalan = new FeatureLayer({
        url: "https://gisportal.binamarga.pu.go.id/arcgis/rest/services/ELRS/BinaMargaLRS2019/MapServer/1",
        popupTemplate: popupTemplate,
        definitionExpression: "BM_PROV_ID = '"+document.getElementById("provinsi").value+"'",
        outFields: ["LINKID", "LINK_NAME", "OBJECTID", "REAL_LENGTH", "START_POINT_IDENTIFIER", "END_POINT_IDENTIFIER"]
    });

    // Tabel gabungan data
    const summary = new FeatureLayer({
        url: "https://gisportal.binamarga.pu.go.id/arcgis/rest/services/ELRS/BinaMargaLRS2019/MapServer/5"
    });

    // Set map's basemap
    const map = new Map({
        basemap: "topo"
    });

    const view = new MapView({
        container: "mapDiv",
        map: map,
        zoom: 4,
        center: [118.015776, -2.6000285],
        navigation: {
            mouseWheelZoomEnabled: false,
            // browserTouchPanEnabled: false
        },
        popup: {
            dockEnabled: true,
            dockOptions: {
                buttonEnabled: false,
                breakpoint: false
            }
        }
    });

    let scaleBar = new ScaleBar({
        view: view,
        unit: 'metric',
        style: 'ruler'
    });

    view.when(function() {
       
        map.addMany([ruas_jalan]);
        
        // console.log(document.getElementById("provinsi").value);
        view.ui.add(scaleBar, {
            position: "bottom-right"
        });
    }, function(error){
        alert('timeout service arcgis 1');
    });
    // view.on("mouse-wheel", function(e) {
    //     warnUser("To zoom in please double click the map. Use zoom in/out buttons.");
    //   });
    view.on('click', function(evt){
        view.hitTest(evt).then(function(resp){
            // console.log(resp);
            if (resp.results.length) {
                var lat = Math.round(evt.mapPoint.latitude * 1000) / 1000;
                var lon = Math.round(evt.mapPoint.longitude * 1000) / 1000;

                var graphic = resp.results.filter(function (result) {
                    // check if the graphic belongs to the layer of interest
                    return result.graphic.layer === ruas_jalan;
                })[0].graphic;

                // console.debug(graphic.attributes);

                // Query parameter berdasarkan data yang dipilih pada map (di sini menggunakan linkid)
                let query = {
                    where: "LINKID = '" + graphic.attributes.LINKID + "'",
                    outFields: ['linkid', 'link_name', 'objectid', 'lintas_name', 'balai_name', 'bm_prov_id', 'lintas_name', 'satker_id', 'satker_name', 'ppk_id','ppk_name'],
                    returnGeometry: false
                };

                // Mengambil data pada tabel gabungan data
                summary.queryFeatures(query).then(result => {
                    if(result.features.length) {
                        //console.debug(result.features[0]);
                        result.features[0].attributes.lat = lat;
                        result.features[0].attributes.lon = lon;

                        //if(confirm("Apakah sudah benar ruas jalan yang anda pilih?")) {
                        // Add to angularJS current scope
                        // var scope = angular.element(document.querySelector('#modal-tahapan')).scope();
                        // scope.$apply(function () {
                        //     scope.bm_map_data = result.features[0].attributes;
                        // });
                        
                        //let map_data = $scope.bm_map_data;
                        // var map_data = result.features[0].attributes;
                        var map_data = result.features[0].attributes;
                        var object_id = map_data.OBJECTID;
                        var link_id = map_data.LINKID;
                        var outside = angular.element(document.getElementById('modal-tahapan')).scope();
                        outside.gehistory(object_id, link_id);
                        // var link_id = map_data.LINKID;
                        // var nama_ruas = map_data.LINK_NAME;
                        // var nama_lintas = map_data.LINTAS_NAME;
                        // var nama_balai  = map_data.BALAI_NAME;
                        // var id_prov = map_data.BM_PROV_ID;
                        // var id_satker = map_data.SATKER_ID;
                        // var nama_satker = map_data.SATKER_NAME;
                        // var id_ppk = map_data.PPK_ID;
                        // var nama_ppk = map_data.PPK_NAME;
                        // var object_id = map_data.OBJECTID;
                        // var no_pengajuan = scope.FormData.no_pengajuan;
                        // // console.log(map_data.OBJECTID);
                        // var formdata = {
                        //     'link_id': link_id,
                        //     'nama_ruas': nama_ruas,
                        //     'object_id': object_id,
                        //     'nama_lintas': nama_lintas,
                        //     'nama_balai': nama_balai,
                        //     'id_prov': id_prov,
                        //     'id_satker': id_satker,
                        //     'nama_satker': nama_satker,
                        //     'id_ppk': id_ppk,
                        //     'nama_ppk': nama_ppk,
                        //     'no_pengajuan': no_pengajuan
                        // };
                       
                    } else {
                        console.debug('No data at this point');
                    }
                });
            }
        });
    });
    view.on('wheel', function(e) {
        e.preventDefault();
        e.stopPropagation();
    
       alert('To zoom in please double click the map. Use zoom in/out buttons.');
    });
});