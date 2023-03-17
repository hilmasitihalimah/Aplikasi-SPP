<?php

namespace App\Controllers;

use App\Controllers\BaseController;

class Dashboardpetugas extends BaseController
{
	public function index()
	{
		$data['intro']='<div class="jumbotron mt-5">
		<h1>Hello, '.session()->get('username').'</h1>
		<p>Silahkan gunakan halaman ini untuk menampilkan informasi SPP anda !</p>
		<p>Tanggal Login : '.date('d M Y').'</p>
	  </div>';
		return view('Dashboard',$data);
		
	}
}
