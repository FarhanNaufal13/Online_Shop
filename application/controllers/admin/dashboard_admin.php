<?php 

/**
 * 
 */
class Dashboard_admin extends CI_Controller
{
	public function __construct(){
		parent::__construct();

		if($this->session->userdata('role_id') != '1'){
			$this->session->set_flashdata('pesan','<div class="alert alert-danger alert-dismissible fade show" role="alert">
				  Anda Belum Login!
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    <span aria-hidden="true">&times;</span>
				  </button>
				</div>');
			redirect('auth/login');
		}
	}

	public function index(){
		$data['total_barang'] = $this->model_barang->total_barang();
		$data['total_invoice'] = $this->model_invoice->total_invoice();
		$data['total_pesanan'] = $this->model_invoice->total_pesanan();
		$data['total_user'] = $this->model_auth->total_user();
		$this->load->view('templates_admin/header');
		$this->load->view('templates_admin/sidebar');
		$this->load->view('admin/dashboard', $data);
		$this->load->view('templates_admin/footer');
	}
}

?>