@extends('template.app')
@section('dashboard', 'active')
@section('active', 'active')
@if ($data->isEmpty())
<script type="text/javascript">
  window.location.href = "{{ route('profile.mentor') }}";
</script>
@else
@section('content')
<div class="row">
    <!-- Total Revenue -->
  <div class="col-lg-8 order-0">
    <div class="card">
      <div class="row row-bordered g-0">
        <div class="col-md-12">
          <h5 class="card-header m-0 me-2 pb-3">Rekap Absensi Mahasiswa Mentor : {{ Auth::user()->nama }}</h5>
            <canvas id="chart"></canvas>
        </div>
      </div>
    </div>
  </div>
  <!--/ Total Revenue -->
  <div class="col-lg-4 col-md-4 order-1">
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="row">
              <div class="col-12 mb-4">
                <div class="card">
                  <div class="card-body">
                    <div class="d-flex justify-content-between flex-sm-row flex-column gap-3">
                      <div class="d-flex flex-sm-column flex-row align-items-start justify-content-between">
                        <div class="card-title">
                          <h5 class="text-nowrap mb-2">Rekap Logbook Mahasiswa</h5>
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
    </div>
    <div class="col-lg-12 col-md-12 order-1">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-6 col-md-8">
                        <h5 class="card-title">Rekap List Mahasiswa</h5>
                    </div>
                </div>
                <div class="table-responsive">
                    <table id="example" class="table table-striped" style="width:100%">
                        <thead>
                            @php
                                $no = 1;
                            @endphp
                            <tr>
                                <th>No</th>
                                <th>Nama Mahasiswa</th>
                                <th>Nomor Induk</th>
                                <th>Mentor Vokasi</th>
                                <th>Dosen Pembimbing</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($list_mahasiswa as $mhs)
                            <tr>
                                <td>{{ $no++ }}</td>
                                <td>{{ $mhs->user->nama }}</td>
                                <td>{{ $mhs->user->nomor_induk }}</td>
                                <td>{{ $mhs->mentor->user->nama }}</td>
                                <td>{{ $mhs->dosen->user->nama }}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const donat = document.getElementById('donat');
    const label_donat = @json($donat['label']);
    const chart = document.getElementById('chart');
    const label_chart = ['Minggu Ke-1','Minggu Ke-2','Minggu Ke-3','Minggu Ke-4'];
    new Chart(donat, {
        type: 'pie',
        data: {
            labels: label_donat,
            datasets: [{
                label: 'Absensi Saya',
                data: @json($donat['data']),
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
                label: 'Hadir',
                data: @json($chart['hadir']),
                borderWidth: 2
            },
            {
                label: 'Tidak Hadir',
                data: @json($chart['tidak_hadir']),
                borderWidth: 2
            },
            {
                label: 'Izin',
                data: @json($chart['izin']),
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
    new DataTable('#dataTable');
    setInterval(updateClock, 1000);
</script>

@endsection
@endif
