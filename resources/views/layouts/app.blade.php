<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
 -->
<!-- beautify ignore:start -->
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  {{-- data-assets-path="../assets/" --}}
  data-template="vertical-menu-template-free"
>
  @include('layouts.head')

  <body>
    @include('sweetalert::alert')
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->
        @include('layouts.sidebar')

        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

          <nav
            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme shadow p-3 rounded"
            id="layout-navbar"
          >
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="bx bx-menu bx-sm"></i>
              </a>
            </div>

            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
              <!-- Search -->
              <div class="navbar-nav align-items-center">
                <div class="nav-item d-flex align-items-center">
                  <i class="bx bx-search fs-4 lh-0"></i>
                  <input
                    type="text"
                    class="form-control border-0 shadow-none"
                    placeholder="Search..."
                    aria-label="Search..."
                  />
                </div>
              </div>
              <!-- /Search -->

              <ul class="navbar-nav flex-row align-items-center ms-auto">
                <!-- Place this tag where you want the button to render. -->

                <!-- User -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                      <img src="{{asset('assets/img/profile/' . Auth::user()->foto_profile)}}" alt class="w-px-40 h-auto rounded-circle" />
                    </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                      <a class="dropdown-item" href="{{url('profile/'.Auth::user()->id)}}">
                        <div class="d-flex">
                          <div class="flex-shrink-0 me-3">
                            <div class="avatar avatar-online">
                              <img src="{{asset('assets/img/profile/' . Auth::user()->foto_profile)}}" alt class="w-px-40 h-auto rounded-circle" />
                            </div>
                          </div>
                          <div class="flex-grow-1">
                            <span class="fw-semibold d-block">{{Auth::user()->nama}}</span>
                            <small class="text-muted">{{Auth::user()->role}}</small>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                    <li>
                      <button type="button" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#logout">
                        <i class="bx bx-power-off me-2"></i>
                        <span class="align-middle">Log Out</span>
                      </button>
                    </li>
                  </ul>
                </li>
                <!--/ User -->
              </ul>
            </div>
          </nav>

          <!-- / Navbar -->

                    <!-- Content wrapper -->
                    <div class="content-wrapper">
                        <!-- Content -->
                        @yield('main')
			            <!-- Footer -->
						<footer class="content-footer footer bg-footer-theme">
							<div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
							  <div class="mb-2 mb-md-0">
								©
								<script>
								  document.write(new Date().getFullYear());
								</script>
								, copyright by
								<a href="https://akti.ac.id" target="_blank" class="footer-link fw-bolder">Akademi Komunitas Toyota Indonesia</a>
							  </div>
							  <div>
								<span>tia.admin@toyota.co.id</span>
							  </div>
							</div>
						  </footer>
						  <!-- / Footer -->

						  <div class="content-backdrop fade"></div>
						</div>
						<!-- Content wrapper -->
					  </div>
					  <!-- / Layout page -->
					</div>

					<!-- Overlay -->
					<div class="layout-overlay layout-menu-toggle"></div>
				  </div>
				  <!-- / Layout wrapper -->

				  <!-- Core JS -->
          <div class="modal fade" id="logout" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">{{ config('app.name') }}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                Apakah Anda Yakin Untuk Logout ?
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <a href="{{ route('logout') }}" class="btn btn-primary">Logout</a>
                </div>
            </div>
            </div>
        </div>
				  <!-- build:js assets/vendor/js/core.js -->
				  <script src="{{asset('assets/vendor/libs/jquery/jquery.js')}}"></script>
				  <script src="{{asset('assets/vendor/libs/popper/popper.js')}}"></script>
				  <script src="{{asset('assets/vendor/js/bootstrap.js')}}"></script>
				  <script src="{{asset('assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js')}}"></script>

				  <script src="{{asset('assets/vendor/js/menu.js')}}"></script>
				  <!-- endbuild -->

				  <!-- Vendors JS -->
				  <script src="{{asset('assets/vendor/libs/masonry/masonry.js')}}"></script>

				  <!-- Main JS -->
				  <script src="{{asset('assets/js/main.js')}}"></script>

				  <!-- Page JS -->

				  <!-- Place this tag in your head or just before your close body tag. -->
				  <script async defer src="https://buttons.github.io/buttons.js"></script>
				  <script>
				  new DataTable('#table');
				  </script>
				</body>
			  </html>
