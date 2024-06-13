<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme shadow p-3 rounded">
    <div class="app-brand demo">
        <a href="#" class="app-brand-link">
            <img src="{{ asset('assets/img/logo-akti.png') }}" width="150" alt="">
        </a>

        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
            <i class="bx bx-chevron-left bx-sm align-middle"></i>
        </a>
    </div>

    <div class="menu-inner-shadow"></div>

    @if (Auth::user()->role == 'admin')
    <ul class="menu-inner py-1">
        <!-- Dashboard -->
        <li class="menu-item {{ $title === 'Dashboard' ? 'active' : '' }}">
            <a href="{{url('admin/dashboard')}}" class="menu-link">
                <i class="menu-icon tf-icons bx bxs-dashboard"></i>
                <div data-i18n="Analytics">Dashboard</div>
            </a>
        </li>

        <!-- Cards -->
        <li class="menu-item {{ $title === 'Manajemen Pengguna' ? 'active' : '' }}">
            <a href="{{url('admin/pengguna')}}" class="menu-link">
                <i class="menu-icon tf-icons bx bx-user"></i>
                <div data-i18n="Basic">Pengguna</div>
            </a>
        </li>
        <li
            class="menu-item {{ $title === 'Mahasiswa' || $title === 'Dosen' || $title === 'Mentor' || $title === 'Section' || $title === 'Departement' ? 'active' : '' }}">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class='menu-icon tf-icons bx bx-command'></i>
                <div data-i18n="Authentications">Manajemen</div>
            </a>
            <ul class="menu-sub">
                <li class="menu-item {{ $title === 'Mahasiswa' ? 'active' : '' }}">
                    <a href="{{url('admin/mahasiswa')}}" class="menu-link">
                        <div data-i18n="Basic">Mahasiswa</div>
                    </a>
                </li>
                <li class="menu-item {{ $title === 'Dosen' ? 'active' : '' }}">
                    <a href="{{url('admin/dosen')}}" class="menu-link">
                        <div data-i18n="Basic">Dosen</div>
                    </a>
                </li>
                <li class="menu-item {{ $title === 'Mentor' ? 'active' : '' }}">
                    <a href="{{url('admin/mentor')}}" class="menu-link">
                        <div data-i18n="Basic">Mentor</div>
                    </a>
                </li>
                <li class="menu-item {{ $title === 'Section' ? 'active' : '' }}">
                    <a href="{{url('admin/section')}}" class="menu-link">
                        <div data-i18n="Basic">Section</div>
                    </a>
                </li>
                <li class="menu-item {{ $title === 'Departement' ? 'active' : '' }}">
                    <a href="{{url('admin/departement')}}" class="menu-link">
                        <div data-i18n="Basic">Departement</div>
                    </a>
                </li>
            </ul>
        </li>
        <li
            class="menu-item {{ $title === 'PPT Final' || $title === 'Laporan TA' || $title === 'A3 Report' || $title === 'Sertifikat' || $title === 'Departement' ? 'active' : '' }}">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class='menu-icon tf-icons bx bxs-report'></i>
                <div data-i18n="Authentications">Report</div>
            </a>
            <ul class="menu-sub">
                <li class="menu-item {{ $title === 'PPT Final' ? 'active' : '' }}">
                    <a href="{{url('admin/report/ppt-final')}}" class="menu-link">
                        <div data-i18n="Basic">PPT Final</div>
                    </a>
                </li>
                <li class="menu-item {{ $title === 'Laporan TA' ? 'active' : '' }}">
                    <a href="{{url('admin/report/laporan-tugas-akhir')}}" class="menu-link">
                        <div data-i18n="Basic">Laporan TA</div>
                    </a>
                </li>
                <li class="menu-item {{ $title === 'A3 Report' ? 'active' : '' }}">
                    <a href="{{url('admin/report/a-tiga-report')}}" class="menu-link">
                        <div data-i18n="Basic">A3 Report</div>
                    </a>
                </li>
                <li class="menu-item {{ $title === 'Sertifikat' ? 'active' : '' }}">
                    <a href="{{url('admin/report/sertifikat')}}" class="menu-link">
                        <div data-i18n="Basic">Sertifikat</div>
                    </a>
                </li>
            </ul>
        </li>
    </ul>
    @elseif(Auth::user()->role == 'dosen')
    <ul class="menu-inner py-1">
        <!-- Dashboard -->
        <li class="menu-item {{ $title === 'Dashboard' ? 'active' : '' }}">
            <a href="{{url('dosen/dashboard')}}" class="menu-link">
                <i class="menu-icon tf-icons bx bxs-dashboard"></i>
                <div data-i18n="Analytics">Dashboard</div>
            </a>
        </li>
        <!-- Cards -->
        <li class="menu-item {{ $title === 'Mahasiswa' ? 'active' : '' }}">
            <a href="{{url('dosen/mahasiswa')}}" class="menu-link">
                <i class='menu-icon tf-icons bx bxs-graduation'></i>
                <div data-i18n="Basic">Mahasiswa</div>
            </a>
        </li>
        <li
            class="menu-item {{ $title === 'PPT Final' || $title === 'Laporan TA' || $title === 'A3 Report' || $title === 'Sertifikat' || $title === 'Departement' ? 'active' : '' }}">
            <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class='menu-icon tf-icons bx bxs-report'></i>
                <div data-i18n="Authentications">Report</div>
            </a>
            <ul class="menu-sub">
                <li class="menu-item {{ $title === 'PPT Final' ? 'active' : '' }}">
                    <a href="{{url('dosen/report/ppt-final')}}" class="menu-link">
                        <div data-i18n="Basic">PPT Final</div>
                    </a>
                </li>
                <li class="menu-item {{ $title === 'Laporan TA' ? 'active' : '' }}">
                    <a href="{{url('dosen/report/laporan-tugas-akhir')}}" class="menu-link">
                        <div data-i18n="Basic">Laporan TA</div>
                    </a>
                </li>
                <li class="menu-item {{ $title === 'A3 Report' ? 'active' : '' }}">
                    <a href="{{url('dosen/report/a-tiga-report')}}" class="menu-link">
                        <div data-i18n="Basic">A3 Report</div>
                    </a>
                </li>
                <li class="menu-item {{ $title === 'Sertifikat' ? 'active' : '' }}">
                    <a href="{{url('dosen/report/sertifikat')}}" class="menu-link">
                        <div data-i18n="Basic">Sertifikat</div>
                    </a>
                </li>
            </ul>
        </li>
    </ul>
    @elseif(Auth::user()->role == 'departement')
    <ul class="menu-inner py-1">
        <!-- Dashboard -->
        <li class="menu-item {{ $title === 'Dashboard' ? 'active' : '' }}">
            <a href="{{url('departement/dashboard')}}" class="menu-link">
                <i class="menu-icon tf-icons bx bxs-dashboard"></i>
                <div data-i18n="Analytics">Dashboard</div>
            </a>
        </li>
        <!-- Cards -->
        <li class="menu-item {{ $title === 'Mahasiswa' ? 'active' : '' }}">
            <a href="{{url('departement/mahasiswa')}}" class="menu-link">
                <i class='menu-icon tf-icons bx bxs-graduation'></i>
                <div data-i18n="Basic">Mahasiswa</div>
            </a>
        </li>
        <li class="menu-item {{ $title === 'Logbook Empat Bulan' ? 'active' : '' }}">
            <a href="{{url('departement/history-logbook')}}" class="menu-link">
                <i class='menu-icon tf-icons bx bx-history'></i>
                <div data-i18n="Basic">History Logbook</div>
            </a>
        </li>
    </ul>
    @endif
</aside>
