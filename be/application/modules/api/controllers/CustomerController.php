<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT");
header('Content-Type: application/json');
header('Access-Control-Allow-Credentials: true');
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class CustomerController extends MX_Controller
{
  function __construct()
    {
        parent::__construct();
        $this->load->model('Customer');
        header('Content-Type: application/json');
        $this->params = json_decode(file_get_contents("php://input"), true);
    }
    public function index() 
    {
        $slrt = new Customer();
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
}