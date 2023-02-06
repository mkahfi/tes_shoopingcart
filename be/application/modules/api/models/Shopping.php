<?php 

class Shopping extends CI_Model{

    function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->params = json_decode(file_get_contents("php://input"), true);
    }
    private function generate()
    {
        for ($i = 0; $i <= 5; $i++) {
            $random = rand(0, 21390);

            $check = $this->db->where('RIGHT(order_id,5)', $random)->get('order_header')->num_rows();
            if (!$check) break;
            else continue;
        }
        return $random;
    }
    private function generate_customer()
    {
        for ($i = 0; $i <= 4; $i++) {
            $random = rand(0, 2193);

            $check = $this->db->where('RIGHT(customer_name,4)', $random)->get('order_header')->num_rows();
            if (!$check) break;
            else continue;
        }
        return $random;
    }
    public function checkoutstok(){
        foreach ($this->params['variable'] as $value) {
            $ab = $this->db->where('pcode', $value['id'])->get('stock')->row();
            if($ab){
                $this->db->where('pcode', $value['id'])->update('stock', array(
                    'jumlah' => $ab->jumlah - $value['item_qty']
                ));
            }

        }
        return true;
    }
    public function mutasi(){
        ini_set('memory_limit', '16069M');
        ini_set('client_buffer_max_kb_size', 998069);
        ini_set('sqlsrv.ClientBufferMaxKBSize', 998069);
        ini_set('max_execution_time', 0);
        error_reporting(-1);
        ini_set('display_errors', 1); 
        try {
            $data = [];
            $detailx = [];
            $solis = array();
            $solis_detail = array();
            foreach ($this->params['variable'] as $value) {
                $data = array(
                    'tgl_mutasi'=> date('Y-m-d H:i:s'),
                    'pcode' => $value['id'],
                    'order_id' => $value['cust_id'],
                    'type_mutasi' => 'O',
                    'jumlah' => $value['item_qty']
                );
                array_push($solis, $data);
            }
            $amazon = $this->db->insert_batch('mutasi_stock', $solis);
            if($amazon) {
                $header_order = array(
                    'order_id' => $this->params['cust_id'],
                    'order_date' => date('Y-m-d H:i:s'),
                    'customer_name' => date('Ym') .'-'.$this->generate_customer(),
                    'promo_code' => $this->params['promo'],
                    'amount_discount' => $this->params['discount'],
                    'net' => $this->params['net'],
                    'ppn' => $this->params['ppn'],
                    'total'=> $this->params['total']
                );
                $order = $this->db->insert('order_header', $header_order);
                if($order){ 
                    foreach ($this->params['variable'] as $valuetf) {
                        $detailx = array(
                            'order_id'=> $valuetf['cust_id'],
                            'pcode' => $valuetf['id'],
                            'qty' => $valuetf['item_qty'],
                            'price' => $valuetf['item_price'],
                            'subtotal' => $valuetf['item_total']
                        );
                        array_push($solis_detail, $detailx);
                    }
                    $detail_order = $this->db->insert_batch('order_detail', $solis_detail);
                    if($detail_order){
                        return true;
                    }else{
                        return false;
                    }
                }else{
                    return false;
                }
            }else{
                return false;
            }
        }catch (Exception $e){
            return $e->getMessage();
        }
    }
    public function generate_id(){
        return 'INV/07/2020/' . $this->generate();
    }
   
}