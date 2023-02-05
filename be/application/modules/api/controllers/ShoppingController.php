<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT");
header('Content-Type: application/json');
header('Access-Control-Allow-Credentials: true');
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class ShoppingController extends MX_Controller
{
  function __construct()
    {
        parent::__construct();
        $this->load->model('Shopping');
        header('Content-Type: application/json');
        $this->params = json_decode(file_get_contents("php://input"), true);
    }
    public function generate_id()
    {
        $slrt = new Shopping();
        $arr = $slrt->generate_id();
        if($arr){
            $data = array(
                'status' => true,
                'count' => 0,
                'data' => $arr
            );  
        }else{
            $data = array(
                'status' => false,
                'count' => 0,
                'data' => $arr
            );
        }
        exit(json_encode($data));
    }
    public function mutasi()
    {
        $slrt = new Shopping();
        $arr = $slrt->mutasi();
        if($arr){
            $data = array(
                'status' => true,
                'count' => 0,
                'data' => $arr
            );  
        }else{
            $data = array(
                'status' => false,
                'count' => 0,
                'data' => $arr
            );
        }
        exit(json_encode($data));
    }
    public function checkoutstok()
    {
        $slrt = new Shopping();
        $arr = $slrt->checkoutstok();
        if($arr){
            $data = array(
                'status' => true,
                'count' => 0,
                'data' => $arr
            );  
        }else{
            $data = array(
                'status' => false,
                'count' => 0,
                'data' => $arr
            );
        }
        exit(json_encode($data));
    }
}