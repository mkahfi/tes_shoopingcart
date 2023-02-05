<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT");
header('Content-Type: application/json');
header('Access-Control-Allow-Credentials: true');
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class ItemController extends MX_Controller
{
  function __construct()
    {
        parent::__construct();
        $this->load->model('Item');
        header('Content-Type: application/json');
        $this->params = json_decode(file_get_contents("php://input"), true);
    }
    public function item()
    {
        $slrt = new Item();
        $arr = $slrt->master_data();
        if($arr){
            $data = array(
                'status' => true,
                'count' => count($arr),
                'data' => $arr
            );
        }else{
            $data = array(
                'status' => false,
                'count' => count($arr),
                'data' => $arr
            );
        }
        exit(json_encode($data));
    }
    public function promo()
    {
        $slrt = new Item();
        $arr = $slrt->master_promo();
        if($arr){
            $data = array(
                'status' => true,
                'count' => count($arr),
                'data' => $arr
            );
        }else{
            $data = array(
                'status' => false,
                'count' => count($arr),
                'data' => $arr
            );
        }
        exit(json_encode($data));
    }
}