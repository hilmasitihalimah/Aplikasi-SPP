<?= $this->include('Home/Header'); ?>

<!-- Awal Konten Aplikasi -->
<main role="main" class="flex-shrink-0">

  <body class="text-center hold-transition login-page bg-image" style="background-image: url('/bg_6.webp'); background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;">
    <div class="container">

      <?php
      if (empty($intro)) {
        $this->renderSection('content');
      } else {
        echo $intro;
      }
      ?>
    </div>
</main>

<?= $this->include('Home/Footer'); ?>