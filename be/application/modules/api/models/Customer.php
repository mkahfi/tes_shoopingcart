<?php 

class Customer extends CI_Model{

    function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
    public function master_data(){
        return $this->db->get('customer')->result_array();
    }
}