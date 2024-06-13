@extends('layouts.app')
@section('main')
<div class="container-xxl flex-grow-1 container-p-y">
    <div class="row">
        <div class="col-lg-8 mb-4 order-0">
            <div class="card">
                <div class="d-flex align-items-end row">
                    <div class="col-sm-7">
                        <div class="card-body">
                            <h5 class="card-title text-primary">Hallo {{Auth::user()->nama}}! 🎉</h5>
                            <p class="mb-4">
                                You have done <span class="fw-bold">72%</span> more sales today. Check your new badge in
                                your profile.
                            </p>
                        </div>
                    </div>
                    <div class="col-sm-5 text-center text-sm-left">
                        <div class="card-body pb-0 px-0 px-md-4">
                            <img src="{{asset('assets/img/illustrations/man-with-laptop-light.png')}}" height="140"
                                alt="View Badge User" data-app-dark-img="illustrations/man-with-laptop-dark.png"
                                data-app-light-img="illustrations/man-with-laptop-light.png" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-4 order-1">
            <div class="row">
                <div class="col-lg-6 col-md-12 col-6 mb-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title d-flex align-items-start justify-content-between">
                                <div class="avatar flex-shrink-0">
                                    <img src="{{asset('assets/img/icons/unicons/chart-success.png')}}"
                                        alt="chart success" class="rounded" />
                                </div>

                            </div>
                            <span class="fw-semibold d-block mb-1">Mahasiswa</span>
                            <h3 class="card-title mb-2">{{$mahasiswa}}</h3>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 col-6 mb-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title d-flex align-items-start justify-content-between">
                                <div class="avatar flex-shrink-0">
                                    <img src="{{asset('assets/img/icons/unicons/wallet-info.png')}}" alt="Credit Card"
                                        class="rounded" />
                                </div>
                            </div>
                            <span>Mentor</span>
                            <h3 class="card-title text-nowrap mb-1">{{$mentor}}</h3>
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
                        <h5 class="card-header m-0 me-2 pb-3">Chart Absensi - {{ date('F Y') }}</h5>
                        <canvas id="absensiChart" class="px-2"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <!--/ Total Revenue -->
        <div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
            <div class="row">
                <div class="col-6 mb-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title d-flex align-items-start justify-content-between">
                                <div class="avatar flex-shrink-0">
                                    <img src="{{asset('assets/img/icons/unicons/paypal.png')}}" alt="Credit Card"
                                        class="rounded" />
                                </div>

                            </div>
                            <span class="d-block mb-1">Section</span>
                            <h3 class="card-title text-nowrap mb-2">{{$section}}</h3>
                        </div>
                    </div>
                </div>
                <div class="col-6 mb-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title d-flex align-items-start justify-content-between">
                                <div class="avatar flex-shrink-0">
                                    <img src="{{asset('assets/img/icons/unicons/cc-primary.png')}}" alt="Credit Card"
                                        class="rounded" />
                                </div>
                            </div>
                            <span class="fw-semibold d-block mb-1">Departement</span>
                            {{-- <h3 class="card-title mb-2">{{$departement}}</h3> --}}
                        </div>
                    </div>
                </div>
                <div class="col-12 mb-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between flex-sm-row flex-column gap-3">
                                <div class="d-flex flex-sm-column flex-row align-items-start justify-content-between">
                                    <div class="card-title">
                                        <h5 class="text-nowrap mb-2">Chart Sebaran Mahasiswa</h5>
                                        <span class="badge bg-label-warning rounded-pill">Year {{date('Y')}}</span>
                                    </div>
                                    <div class="mt-sm-auto">
                                        <canvas id="lokasiChart"></canvas>
                                    </div>
                                </div>
                                <div id="profileReportChart"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script>
    var ctx = document.getElementById('absensiChart').getContext('2d');
    var jumlahAbsensiData = @json($jumlahAbsensiPerMinggu);

    var labels = [];
    var data = [];

    for (var minggu in jumlahAbsensiData) {
        labels.push(minggu);
        data.push(jumlahAbsensiData[minggu]);
    }

    var absensiChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Jumlah Absensi',
                data: data,
                backgroundColor: 'maroon',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
</script>
{{-- <script>
    var ctx = document.getElementById('lokasiChart').getContext('2d');
    var lokasiData = @json($lokasi);

    var labels = [];
    var data = [];

    for (var lokasi in lokasiData) {
        labels.push(lokasi);
        data.push(lokasiData[lokasi]);
    }

    var lokasiChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: labels,
            datasets: [{
                label: 'Jumlah Mahasiswa Magang',
                data: data,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false
        }
    });
</script> --}}
@endsection