<?= $this->include('Layout/Header'); ?>

<!-- Awal Konten Aplikasi -->

<body class="text-center hold-transition login-page bg-image" style="background-image: url('/bg_6.webp'); background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;">
  <div class="container" style="margin-top:100px">
    <?php
    if (empty($intro)) {
      $this->renderSection('content');
    } else {
      echo $intro;
    }
    ?>
  </div>
  </main>

  <?= $this->include('Layout/Modal'); ?>
  <?= $this->include('Layout/Footer'); ?>