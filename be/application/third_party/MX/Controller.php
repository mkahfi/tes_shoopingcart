<?php

(defined('BASEPATH')) or exit('No direct script access allowed');

/** load the CI class for Modular Extensions * */
require dirname(__FILE__) . '/Base.php';

/**
 * Modular Extensions - HMVC
 *
 * Adapted from the CodeIgniter Core Classes
 * @link    http://codeigniter.com
 *
 * Description:
 * This library replaces the CodeIgniter Controller class
 * and adds features allowing use of modules and the HMVC design pattern.
 *
 * Install this file as application/third_party/MX/Controller.php
 *
 * @copyright    Copyright (c) 2015 Wiredesignz
 * @version     5.5
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 * */
class MX_Controller
{

    public $autoload = array();

    public function __construct()
    {
        $class = str_replace(CI::$APP->config->item('controller_suffix'), '', get_class($this));
        log_message('debug', $class . " MX_Controller Initialized");
        Modules::$registry[strtolower($class)] = $this;

        /* copy a loader instance and initialize */
        $this->load = clone load_class('Loader');
        $this->load->initialize($this);

        /* autoload module items */
        $this->load->_autoloader($this->autoload);

    }

    public function __get($class)
    {
        return CI::$APP->$class;
    }

    public function _authLogin($role_id = null)
    {

        //print_r($_SESSION); exit;
        $this->_checkAgent();

        if (!isset($_SESSION['login'])) {
            $_SESSION['msg'] = 'Anda Belum Login';
            redirect('kemsos/login/login_form/1');
        } else {
            if ($_SESSION['login'] == false) {
                $_SESSION['msg'] = 'Anda Belum Login';
                redirect('kemsos/login/login_form/1');
            }

        }

        if (!isset($_SESSION['user'])) {
            $_SESSION['msg'] = 'Anda Belum Login';
            redirect('kemsos/login/login_form/1');
        }

        if (!isset($_SESSION['token'])) {
            $_SESSION['msg'] = 'Anda Belum Login';
            redirect('kemsos/login/login_form/1');
        }

        if ($role_id != null) {
            $redirect = 0;

            foreach ($role_id as $row) {
                if ($_SESSION['user']['role_id'] == $row) {
                    $redirect = 1;
                }
            }

            if ($redirect == 0) {
                unset($_SESSION['login']);
                $_SESSION['msg'] = 'Anda Tidak Diizinkan';
                redirect('kemsos/login/login_form/1');
            }

        }
    }

    public function _checkAgent()
    {
        if ($this->agent->is_robot()) {
            $this->output->set_status_header(401);
            $agent = $this->agent->robot();
            exit("Invalid Access With :" . $agent);
        }

        if ($this->agent->is_browser()) {
            $agent = $this->agent->browser();
//                 if($agent!='Chrome' and $agent!='Firefox' and $agent!='Mozilla' and $agent!='Safari') {
            //                      exit("SIKS tidak bisa diakses dengan browser ".$agent." mohon gunakan <b>Chrome</b>, <b>Mozilla Firefox</b>, atau <b>Safari</b> ");
            //                 }
            if ($agent != 'Chrome' and $agent != 'Firefox' and $agent != 'Mozilla' and $agent != 'Safari') {
                exit("SIKS tidak bisa diakses dengan browser " . $agent . " mohon gunakan <b>Chrome</b> atau <b>Safari</b> ");
            }
        }
    }

    public function _authMenu($id_menu)
    {
        $query = $this->db->query("select TOP 1 from m_role_menu where role_id = {$_SESSION['user']['role_id']} and menu_id = {$id_menu} ");
        //
        if ($query->num_rows() <= 0) {
            $_SESSION['msg'] = 'Anda Tidak Memiliki Hak Akses Ke Menu Ini';
            redirect('kemsos/login/login_form/1');
        }

    }

    /* public function _authMenu2($class_name, $function_name)
    {
        $query1 = $this->db->query("select * from m_menu where m_menu.[class] = '" . $class_name . "' and m_menu.[function] = '" . $function_name . "'")->result_array();
		
        if (count($query1) > 1) {
            $query2 = $this->db->query("select * from m_role_menu where role_id = {$_SESSION['user']['role_id']} and menu_id = {$query1[1]['menu_id']} ");
        }else{
            $query2 = $this->db->query("select * from m_role_menu where role_id = {$_SESSION['user']['role_id']} and menu_id = {$query1[0]['menu_id']} ");
        }

        if ($query2->num_rows() <= 0) {
            return false;
        } else {
            return true;
        }

    } */

    public function _authMenu2($class_name, $function_name)
    {
		$query	= "SELECT rm.*, mm.menu_name, mm.module, mm.class, mm.[function] FROM m_role_menu rm 
				LEFT JOIN m_menu mm ON rm.menu_id = mm.menu_id WHERE rm.role_id = {$_SESSION['user']['role_id']} 
				AND mm.[class] = '{$class_name}' AND mm.[function] = '{$function_name}' AND mm.stat_aktif = 1";

		$result = $this->db->query($query)->result_array();
		if (count($result) <= 0) {
            return false;
        } else {
            return true;
        }
	}

    public function _notif($msg, $kdkab)
    {

        $data = $this->db->query("select * from m_user where kode_kab = '{$kdkab}' and role_id = 4")->row_array();

        $data2 = array();
        $data2['informasi'] = $data['nama'] . " " . $msg;
        $data2['kode_kab'] = $data['kode_kab'];
        $data2['kode_provinsi'] = $data['kode_provinsi'];
        $data2['role_id'] = $data['role_id'];
        $data2['username'] = $data['username'];
        $data2['tanggal'] = date("Y-m-d H:i:s");
        $this->db->insert('informasi', $data2);
        $info_id = $this->db->insert_id();

        $this->db->insert('informasi', $data2);

    }

    public function _info($msg, $ket = null, $id = null)
    {
        $data = array();
        $data['informasi'] = $_SESSION['user']['nama'] . " " . $msg;
        $data['kode_kab'] = $_SESSION['user']['kode_kab'];
        $data['kode_provinsi'] = $_SESSION['user']['kode_provinsi'];
        $data['role_id'] = $_SESSION['user']['role_id'];
        $data['username'] = $_SESSION['user']['username'];
        $data['tanggal'] = date("Y-m-d H:i:s");
        $this->db->insert('informasi', $data);
        $info_id = $this->db->insert_id();

        if ($ket != null and $id != null) {
            $data2 = array();
            $data2['info_id'] = $info_id;

            if ($ket == 'usulan') {
                $data2['rt_id'] = $id;
            } elseif ($ket == 'perbaikan') {
                $data2['NoPBDTKemsos'] = $id;
            }
            $this->db->insert('informasi_rt', $data2);
        }
    }

    public function _infolks($msg, $ket = null, $id = null)
    {
        $data = array();
        $data['informasi'] = $_SESSION['user']['nama'] . " " . $msg;
        $data['kode_kab'] = $_SESSION['user']['kode_kab'];
        $data['kode_provinsi'] = $_SESSION['user']['kode_provinsi'];
        $data['role_id'] = $_SESSION['user']['role_id'];
        $data['username'] = $_SESSION['user']['username'];
        $data['tanggal'] = date("Y-m-d H:i:s");
        $data['sta_anak'] = 1;
        $this->db->insert('informasi', $data);
        $info_id = $this->db->insert_id();

        if ($ket != null and $id != null) {
            $data2 = array();
            $data2['info_id'] = $info_id;

            if ($ket == 'usulan') {
                $data2['rt_id'] = $id;
            } elseif ($ket == 'perbaikan') {
                $data2['NoPBDTKemsos'] = $id;
            }
            $this->db->insert('informasi_rt', $data2);
        }
    }

    public function _infoSanggahan($msg, $ket = null)
    {
        $data = array();
        $data['informasi'] = $_SESSION['user']['nama'] . " " . $msg;
        $data['kode_kab'] = $_SESSION['user']['kode_kab'];
        $data['kode_provinsi'] = $_SESSION['user']['kode_provinsi'];
        $data['role_id'] = $_SESSION['user']['role_id'];
        $data['username'] = $_SESSION['user']['username'];
        $data['tanggal'] = date("Y-m-d H:i:s");
        $data['jenis_info'] = 2;

        $this->db->insert('informasi', $data);
        $info_id = $this->db->insert_id();
    }

    public function _infoanak($msg, $kdgabungan, $kdprop, $ket = null, $id = null)
    {
        $data = array();
        $data['informasi'] = $_SESSION['user']['nama'] . " " . $msg;
        $data['kode_kab'] = $kdgabungan;
        $data['kode_provinsi'] = $kdprop;
        $data['role_id'] = $_SESSION['user']['role_id'];
        $data['username'] = $_SESSION['user']['username'];
        $data['tanggal'] = date("Y-m-d H:i:s");
        $data['sta_anak'] = 1;
        $this->db->insert('informasi', $data);
        $info_id = $this->db->insert_id();

        if ($ket != null and $id != null) {
            $data2 = array();
            $data2['info_id'] = $info_id;

            if ($ket == 'usulan') {
                $data2['rt_id'] = $id;
            } elseif ($ket == 'perbaikan') {
                $data2['NoPBDTKemsos'] = $id;
            }
            $this->db->insert('informasi_rt', $data2);
        }
    }
	
	public function _infolklks($msg, $kdgabungan, $kdprop, $lingkup,$ket = null, $id = null)
    {
        if ($lingkup == 1) {
			$data = array();
			$data['informasi'] = $_SESSION['user']['nama'] . " " . $msg;
			$data['kode_kab'] = $kdgabungan;
			$data['kode_provinsi'] = $kdprop;
			$data['role_id'] = $_SESSION['user']['role_id'];
			$data['username'] = $_SESSION['user']['username'];
			$data['tanggal'] = date("Y-m-d H:i:s");
			$data['sta_anak'] = 1;
			$this->db->insert('informasi', $data);
			$info_id = $this->db->insert_id();

			if ($ket != null and $id != null) {
				$data2 = array();
				$data2['info_id'] = $info_id;

				if ($ket == 'usulan') {
					$data2['rt_id'] = $id;
				} elseif ($ket == 'perbaikan') {
					$data2['NoPBDTKemsos'] = $id;
				}
				$this->db->insert('informasi_rt', $data2);
			}
		} elseif ($lingkup == 2) {
			$data = array();
			$data['informasi'] = $_SESSION['user']['nama'] . " " . $msg;
			$data['kode_kab'] = $kdgabungan;
			$data['kode_provinsi'] = $kdprop;
			$data['role_id'] = $_SESSION['user']['role_id'];
			$data['username'] = $_SESSION['user']['username'];
			$data['tanggal'] = date("Y-m-d H:i:s");
			$this->db->insert('informasi', $data);
			$info_id = $this->db->insert_id();

			if ($ket != null and $id != null) {
				$data2 = array();
				$data2['info_id'] = $info_id;

				if ($ket == 'usulan') {
					$data2['rt_id'] = $id;
				} elseif ($ket == 'perbaikan') {
					$data2['NoPBDTKemsos'] = $id;
				}
				$this->db->insert('informasi_rt', $data2);
			}
		}
    }

    public function _outputjson($data)
    {
        $data = json_encode($data);
        $length = strlen($data);
        header('Content-Type: application/json; charset=utf-8');
        header('Content-Length: ' . $length);
        header('Access-Control-Allow-Origin: *');
        echo $data;
        exit();
    }

    public function _outputjsonpost($data)
    {
        $data = json_encode($data);
        $length = strlen($data);
        header('Content-Type: application/json; charset=utf-8');
        header('Content-Length: ' . $length);
        echo $data;
        exit();
    }

    public function _outputcurl($data)
    {
        $length = strlen($data);
        header('Content-Type: application/json');
        header('Content-Length: ' . $length);
        echo $data;
        exit();
    }

    public function _checkToken($token)
    {
        $enc = explode('#', MyEncrypt::_base64_decrypt($token, $this->config->item('encryption_key')));

        if (count($enc) == 5) {
            $ress = ['role_id' => $enc[0], 'kode_provinsi' => $enc[1], 'kode_kab' => $enc[2], 'kode_kecamatan' => $enc[3], 'kode_desa' => $enc[4]];

        } else {
            $ress = 0;
        }

        return $ress;
    }

    public function _generateToken()
    {
        $key = $_SESSION['user']['role_id'] . '#' . $_SESSION['user']['kode_provinsi'] . '#' . $_SESSION['user']['kode_kab'] . '#' . $_SESSION['user']['kode_kecamatan'] . '#' . $_SESSION['user']['kode_desa'];
        $token = MyEncrypt::_base64_encrypt($key, $this->config->item('encryption_key'));
        return $token;
    }

    public function _encrypt_password_callback($password)
    {
        return MyEncrypt::_base64_encrypt($password, $this->config->item('encryption_key'));
    }

    public function _decrypt_password_callback($password)
    {
        return MyEncrypt::_base64_decrypt($password, $this->config->item('encryption_key'));
    }

    public function cekpassword($enc)
    {
        echo $this->_decrypt_password_callback($enc);
    }

    public function _checkPost()
    {
        $token = $this->input->post($this->_encrypt_password_callback('token'));
        $valid = $this->_encrypt_password_callback('siksng-28');

        if ($token != $valid) {
            $this->output->set_status_header(401);
            exit('Invalid Access');
        }

    }

    public function mssql_escape_string($data)
    {
        if (!isset($data) or empty($data)) {
            return '';
        }

        if (is_numeric($data)) {
            return $data;
        }

        $non_displayables = array(
            '/%0[0-8bcef]/', // url encoded 00-08, 11, 12, 14, 15
            '/%1[0-9a-f]/', // url encoded 16-31
            '/[\x00-\x08]/', // 00-08
            '/\x0b/', // 11
            '/\x0c/', // 12
            '/[\x0e-\x1f]/', // 14-31
        );
        foreach ($non_displayables as $regex) {
            $data = preg_replace($regex, '', $data);
        }

        $data = str_replace("'", "''", $data);
        return $data;
    }


    public function _ressJson($data_json) {
        $json = json_encode($data_json);
        if ($json === false) {
            $json = json_encode(["jsonError" => json_last_error_msg()]);
            if ($json === false) {
                $json = '{"jsonError":"unknown"}';
            }
            http_response_code(500);
        }
    echo $json;
    }


    public function kode_sotk(){
        
        if(isset($_SESSION['user']['kode_sotk'])) {
            $kode_sotk = $_SESSION['user']['kode_sotk'];
        }
        else {
            $kode_sotk = '-';
        }


        return $kode_sotk;
    }

    public function instansi(){
        
        if(isset($_SESSION['user']['instansi'])) {
            $instansi = $_SESSION['user']['instansi'];
        }
        else {
            $instansi = '-';
        }


        return $instansi;
    }

}
