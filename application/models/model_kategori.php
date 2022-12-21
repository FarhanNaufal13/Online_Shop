<?php 

/**
 * 
 */
class Model_kategori extends CI_Model
{
	
	public function data_tshirt()
	{
		return $this->db->get_where("tb_barang", array('kategori' => 'tshirt'));
	}

	public function data_jacket()
	{
		return $this->db->get_where("tb_barang", array('kategori' => 'jacket'));
	}

	public function data_bottom()
	{
		return $this->db->get_where("tb_barang", array('kategori' => 'bottom'));
	}

	public function data_accessories()
	{
		return $this->db->get_where("tb_barang", array('kategori' => 'accessories'));
	}
}