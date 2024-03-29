<?= $this->extend('Dashboard') ?>
<?= $this->section('content') ?>
<h2>Penambahan Kelas</h2>
<p>Silahkan masukan data kelas baru pada form dibawah ini</p>

<form method="POST" action="/kelas/simpan">
<div class="form-group">
    <label class="font-weight-bold">Nama Kelas</label>
    <input type="text" name="txtNamaKelas" class="form-control" placeholder="Masukan nama kelas" autocomplete="off" autofocus required>
</div>

<div class="form-group">
    <label class="font-weight-bold"> 	Kompetensi Keahlian</label>
    <input type="text" name="txtInputKompetensi" class="form-control" placeholder="Masukan nama kompetensi keahlian" autocomplete="off" required>
</div>

<div class="form-group">
    <button class="btn btn-primary"><i class="fas fa-save"></i> Simpan </button>
</div>

</form>
<?=$this->endSection();?>