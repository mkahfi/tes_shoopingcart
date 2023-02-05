<?php 

class Item extends CI_Model{

    function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
    public function master_data(){
        return $this->db->get('product')->result_array();
    }
    public function master_promo(){
        return $this->db->get('promo')->result_array();
    }
}