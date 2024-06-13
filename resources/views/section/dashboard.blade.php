@extends('template.app')
@section('dashboard', 'active')

@if ($data->isEmpty())
<script type="text/javascript">
    window.location.href = "{{ route('profile.section') }}";
</script>
@else
@section('content')
    <div class="row">
      <div class="col-lg-8 mb-4 order-0">
        <div class="card">
          <div class="d-flex align-items-end row">
            <div class="col-sm-7">
              <div class="card-body">
                <h5 class="card-title text-primary">Selamat Datang! 🎉</h5>
                <p class="mb-4">
                    <span class="fw-bold">{{ Auth::user()->nama }}</span> Di {{ config('app.name') }}
                </p>
              </div>
            </div>
            <div class="col-sm-5 text-center text-sm-left">
              <div class="card-body pb-0 px-0 px-md-4">
                <img
                  src="{{ asset('assets/img/illustrations/man-with-laptop-light.png') }}"
                  height="140"
                  alt="View Badge User"
                  data-app-dark-img="illustrations/man-with-laptop-dark.png"
                  data-app-light-img="illustrations/man-with-laptop-light.png"
                />
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-4 col-md-4 order-1">
        <div class="row">
          <div class="col-lg-12 col-md-12 col-12 mb-4">
            <div class="card">
              <div class="card-body">
                <div class="card-title d-flex align-items-start justify-content-between">
                  <div class="avatar flex-shrink-0">
                    <img
                      src="{{ asset('assets/img/icons/unicons/chart-success.png') }}"
                      alt="chart success"
                      class="rounded"
                    />
                  </div>
                  <div class="dropdown">
                    <button
                      class="btn p-0"
                      type="button"
                      id="cardOpt3"
                      data-bs-toggle="dropdown"
                      aria-haspopup="true"
                      aria-expanded="false"
                    >
                      <i class="bx bx-dots-vertical-rounded"></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt3">
                      <a class="dropdown-item" href="javascript:void(0);">View More</a>
                      <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                    </div>
                  </div>
                </div>
                <span class="fw-semibold d-block mb-1">asdj</span>
                <h3 id="clock" class="card-title mb-2"></h3>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Total Revenue -->
      <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
        <div class="card">
          <div class="row row-bordered g-0">
            <div class="col-md-12">
              <h5 class="card-header m-0 me-2 pb-3">Rekap Logbook 5 Minggu Terakhir</h5>
              <canvas id="chart"></canvas>
            </div>
          </div>
        </div>
      </div>
      <!--/ Total Revenue -->
      <div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
        <div class="row">
          <div class="col-12 mb-4">
            <div class="card">
              <div class="card-body">
                <div class="d-flex justify-content-between flex-sm-row flex-column gap-3">
                  <div class="d-flex flex-sm-column flex-row align-items-start justify-content-between">
                    <div class="card-title">
                      <h5 class="text-nowrap mb-2">Rekap Absen Bulan - </h5>
                    </div>
                    </div>
                </div>
            </div>
            <div class="card-title">
                <canvas id="donat"></canvas>
            </div>
            </div>
          </div>
        </div>
      </div>
    </div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
{{-- @dd($donat) --}}

<script>
    const donat = document.getElementById('donat');
    const label_donat = ['ad','akid'];
    const chart = document.getElementById('chart');
    const label_chart = ['Minggu Ke-1','Minggu Ke-2','Minggu Ke-3','Minggu Ke-4', 'Minggu Ke-5'];

    new Chart(donat, {
        type: 'pie',
        data: {
            labels: label_donat,
            datasets: [{
                label: 'Absensi Saya',
                data: [1,2,3],
                backgroundColor: [
                    'rgb(255, 99, 132)',
                    'rgb(54, 162, 235)',
                    'rgb(255, 205, 86)'
                ],
                hoverOffset: 4
            }]
        }
    });

    new Chart(chart, {
        type: 'bar',
        data: {
        labels: label_chart,
        datasets: [
                {
                    label: 'Accept',
                    data: [1,2,4,55,3],
                    borderWidth: 2
                },
                {
                    label: 'Reject',
                    data: [1,2,4,55,3],
                    borderWidth: 2
                },
                {
                    label: 'Pending',
                    data: [1,2,4,55,3],
                    borderWidth: 2
                }
            ]
        },
        options: {
        scales: {
            y: {
            beginAtZero: true
            }
        }
        }
    });

    function updateClock() {
        var now = new Date();
        now.setHours(now.getHours());
        var hours = now.getHours();
        var minutes = now.getMinutes();
        var seconds = now.getSeconds();

        hours = (hours < 10 ? "0" : "") + hours;
        minutes = (minutes < 10 ? "0" : "") + minutes;
        seconds = (seconds < 10 ? "0" : "") + seconds;

        var timeString = hours + ':' + minutes + ':' + seconds;

        document.getElementById('clock').innerHTML = timeString;
    }
    setInterval(updateClock, 1000);
</script>
@endsection
@endif
