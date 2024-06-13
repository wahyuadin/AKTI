<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
  <div class="app-brand demo">
    <a href="{{ route('dashboard.'. Auth::user()->role) }}" class="app-brand-link">
      <img src="{{ asset('assets/img/logo-akti.png') }}" width="150" alt="">
    </a>

    <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
      <i class="bx bx-chevron-left bx-sm align-middle"></i>
    </a>
  </div>

  <div class="menu-inner-shadow"></div>

  <ul class="menu-inner py-1">
    <!-- Dashboard -->
    <li class="menu-item @yield('dashboard')">
      <a href="{{ route('dashboard.' . Auth::user()->role) }}" class="menu-link">
        <i class="menu-icon tf-icons bx bx-home-circle"></i>
        <div data-i18n="Analytics">Dashboard</div>
      </a>
    </li>
    @if (Auth::user()->role == 'mahasiswa')
    <li class="menu-header small text-uppercase">
      <span class="menu-header-text">Mahasiswa</span>
    </li>
    <li class="menu-item @yield('mahasiswa')">
      <a href="javascript:void(0);" class="menu-link menu-toggle">
        <i class="menu-icon tf-icons bx bx-book-reader"></i>
        <div data-i18n="Account Settings">Logbook</div>
      </a>
      <ul class="menu-sub">
        <li class="menu-item @yield('logbook')">
          <a href="{{ route('logbook.' . Auth::user()->role) }}" class="menu-link">
            <div data-i18n="Account">Logbook Bulanan</div>
          </a>
        </li>
        <li class="menu-item @yield('evaluasi')">
          <a href="{{ route('logbook.evaluasi') }}" class="menu-link">
            <div data-i18n="Notifications">Logbook Evaluasi 4 Bulan</div>
          </a>
        </li>
      </ul>
    </li>
    <li class="menu-item @yield('upload')">
      <a href="javascript:void(0);" class="menu-link menu-toggle">
        <i class="menu-icon tf-icons bx bx-upload"></i>
        <div data-i18n="Authentications">Upload</div>
      </a>
      <ul class="menu-sub">
        <li class="menu-item @yield('presentasi_final')">
          <a href="{{ route('presentasi_final.upload.mahasiswa') }}" class="menu-link">
            <div data-i18n="Basic">Presentasi Final</div>
          </a>
        </li>
        <li class="menu-item @yield('laporan_ta')">
          <a href="{{ route('laporan_ta.upload.mahasiswa') }}" class="menu-link">
            <div data-i18n="Basic">Laporan Tugas Akhir</div>
          </a>
        </li>
        <li class="menu-item @yield('report_a3')">
          <a href="{{ route('report_a3.upload.mahasiswa') }}" class="menu-link">
            <div data-i18n="Basic">A3 Report</div>
          </a>
        </li>
        <li class="menu-item @yield('sertifikat')">
          <a href="{{ route('sertifikat.upload.mahasiswa') }}" class="menu-link">
            <div data-i18n="Basic">Sertifikat</div>
          </a>
        </li>
      </ul>
    </li>
    <li class="menu-header small text-uppercase">
      <span class="menu-header-text">Absensi</span>
    </li>
    <li class="menu-item @yield('absensi')">
      <a href="javascript:void(0);" class="menu-link menu-toggle">
        <i class="menu-icon tf-icons bx bxs-user-detail"></i>
        <div data-i18n="Authentications">Absensi</div>
      </a>
      <ul class="menu-sub">
        <li class="menu-item @yield('absensi_kehadiran')">
          <a href="{{ route('absensi.kehadiran') }}" class="menu-link">
            <div data-i18n="Basic">Kehadiran</div>
          </a>
        </li>
      </ul>
    </li>
    @elseif (Auth::user()->role == 'mentor')
    <!-- Components -->
    <li class="menu-header small text-uppercase"><span class="menu-header-text">Mentor</span></li>
    <!-- User interface -->
    <li class="menu-item @yield('mentor')">
      <a href="javascript:void(0)" class="menu-link menu-toggle">
        <i class="menu-icon tf-icons bx bx-book-open"></i>
        <div data-i18n="User interface">Logbook Mahasiswa</div>
      </a>
      <ul class="menu-sub">
        <li class="menu-item @yield('logbook')">
          <a href="{{ route('logbook.mentor') }}" class="menu-link">
            <div data-i18n="Accordion">Logbook</div>
          </a>
        </li>
      </ul>
    </li>
    <li class="menu-item @yield('data')">
      <a href="javascript:void(0)" class="menu-link menu-toggle">
        <i class="menu-icon tf-icons bx bxs-data"></i>
        <div data-i18n="User interface">Data</div>
      </a>
      <ul class="menu-sub">
        <li class="menu-item @yield('pengajuan_mentor')">
          <a href="{{ route('pengajuan_mentor') }}" class="menu-link">
            <div data-i18n="Accordion">Pengajuan Mentor</div>
          </a>
        </li>
      </ul>

      <ul class="menu-sub">
        <li class="menu-item @yield('list_mahasiswa')">
          <a href="{{ route('list_mahasiswa') }}" class="menu-link">
            <div data-i18n="Accordion">List Mahasiswa</div>
          </a>
        </li>
      </ul>
    </li>
    <li class="menu-item @yield('absensi')">
        <a href="javascript:void(0)" class="menu-link menu-toggle">
          <i class="menu-icon tf-icons bx bxs-user-account"></i>
          <div data-i18n="User interface">Absensi Mahasiswa</div>
        </a>
        <ul class="menu-sub">
          <li class="menu-item @yield('absen')">
            <a href="{{ route('absensi_mahasiswa') }}" class="menu-link">
              <div data-i18n="Accordion">List Absen Mahasiswa</div>
            </a>
          </li>
        </ul>
      </li>
    @elseif (Auth::user()->role == 'departemen_head')
    <!-- Misc -->
    <li class="menu-header small text-uppercase"><span class="menu-header-text">Section Head</span></li>
    <li class="menu-item">
      <a href="https://github.com/themeselection/sneat-html-admin-template-free/issues" target="_blank"
        class="menu-link">
        <i class="menu-icon tf-icons bx bx-sitemap"></i>
        <div data-i18n="Support">Support</div>
      </a>
    </li>
    @endif
  </ul>
</aside>
