@extends('layouts.app')
@section('main')
<div class="container-xxl flex-grow-1 container-p-y">
    @if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
            <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
    @endif
    @if(session('create'))
    <script>
        // Tampilkan pesan dengan SweetAlert
    Swal.fire({
        title: 'Success',
        text: '{{ session('create') }}',
        icon: 'success',
        confirmButtonText: 'OK'
    });
    </script>
    @endif
    @if(session('update'))
    <script>
        // Tampilkan pesan dengan SweetAlert
    Swal.fire({
        title: 'Update',
        text: '{{ session('update') }}',
        icon: 'success',
        confirmButtonText: 'OK'
    });
    </script>
    @endif
    @if(session('delete'))
    <script>
        // Tampilkan pesan dengan SweetAlert
    Swal.fire({
        title: 'Delete',
        text: '{{ session('delete') }}',
        icon: 'success',
        confirmButtonText: 'OK'
    });
    </script>
    @endif
    <div class="card shadow p-3 mb-5 rounded border">
        <div class="card-header d-flex justify-content-between">
            <h5>Tabel Absensi {{$data->user->nama}}</h5>
            <form action="" method="get">
                <select class="form-select" aria-label="Default select example">
                    <option disabled>Filter by month</option>
                    <option value="Januari">Januari</option>
                </select>
            </form>
        </div>
        <div class="card-body">
            <div class="table-responsive text-nowrap">
                <table class="table table-hover table-bordered" id="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Waktu</th>
                            <th scope="col">Keterangan</th>
                            <th scope="col">Deskripsi</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider">
                        @php
                        $no=1;
                        @endphp
                        <tr>
                            <th scope="row">{{ $no++ }}</th>
                            <td>{{ $data->absensi->value('waktu') }}</td>
                            <td>{{ $data->absensi->value('keterangan') }}</td>
                            <td>{{ $data->absensi->value('deskripsi') }}</td>
                            <td>
                                @if ($data->absensi->value('status') == 'accept')
                                <button class="btn btn-primary btn-sm">{{ $data->absensi->value('status') }}</button>
                                @elseif ($data->absensi->value('status') == 'reject')
                                <button class="btn btn-danger btn-sm">{{ $data->absensi->value('status') }}</button>
                                @else
                                <button class="btn btn-warning btn-sm">{{ $data->absensi->value('status') }}</button>
                                @endif
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="card mb-3 table-hover table-bordered">
        <div class="card-body">
            <h5 class="card-title">Logbook Mingguan</h5>
            <div class="text-center">
                <embed src="{{asset('cv.pdf')}}" type="application/pdf" height="400" width="1000">
            </div>
        </div>
    </div>
    <div class="card mb-3 table-hover table-bordered">
        <div class="card-body">
            <h5 class="card-title">Evaluasi</h5>
            <div class="text-center">
                <embed src="{{asset('cv.pdf')}}" type="application/pdf" height="400" width="1000">
            </div>
        </div>
    </div>
</div>
<script>
    function clickHM() {
      Swal.fire({
          title: 'Konfirmasi',
          text: 'Apakah Anda yakin ingin menghapus ini?',
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Ya, Hapus!',
          cancelButtonText: 'Batal'
      }).then((result) => {
          if (result.isConfirmed) {
              document.getElementById('hapusMahasiswa').submit();
          }
      });

  }
</script>
@endsection
