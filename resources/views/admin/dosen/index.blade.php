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
        <h5 class="card-header">Tabel {{$title}}</h5>
        <div class="card-body">
            <div class="table-responsive text-nowrap">
                <table class="table table-hover table-bordered" id="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nama</th>
                            <th scope="col">Email</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider">
                        @php
                        $no=1;
                        @endphp
                        @foreach ($data as $item)
                        <tr>
                            <th scope="row">{{$no++}}</th>
                            <td>{{$item->user->nama}} - {{$item->prodi}}</td>
                            <td>{{$item->user->email}}</td>
                            <td>
                                <div class="d-flex">
                                    <!-- Button trigger modal -->
                                    <button type="button" class="btn btn-warning btn-sm" data-bs-toggle="modal"
                                        data-bs-target="#modal{{$item->id}}">
                                        <i class='bx bx-edit'></i>
                                    </button>

                                    <!-- Modal -->
                                    <div class="modal fade" id="modal{{$item->id}}" tabindex="-1"
                                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Edit Data</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="{{url('admin/mahasiswa/'.$item->id)}}" method="post">
                                                        @csrf
                                                        @method('put')
                                                        <div class="row">
                                                            <input type="text" name="user_id" value="{{$item->user_id}}" hidden>
                                                            <div class="col-4">
                                                                <label for="exampleFormControlInput1"
                                                                    class="form-label">Nama
                                                                    Dosen</label>
                                                                <input type="text" class="form-control"
                                                                    id="exampleFormControlInput1" name="nama"
                                                                    value="{{$item->user->nama}}" required>
                                                            </div>
                                                            <div class="col-4">
                                                                <label for="exampleFormControlInput1"
                                                                    class="form-label">Nomor Induk
                                                                    Pegawai</label>
                                                                <input type="number" class="form-control"
                                                                    id="exampleFormControlInput1"
                                                                    name="nomor_induk"
                                                                    value="{{$item->user->nomor_induk}}" required>
                                                            </div>
                                                            <div class="col-4">
                                                                <label for="exampleFormControlInput1"
                                                                    class="form-label">Prodi</label>
                                                                <input type="text" class="form-control"
                                                                    id="exampleFormControlInput1"
                                                                    name="prodi"
                                                                    value="{{$item->prodi}}" required>
                                                            </div>
                                                        </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit" class="btn btn-primary">Simpan</button>
                                                </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <form action="{{url('admin/dosen/'.$item->id)}}" method="post" id="hapusDosen">
                                        @csrf
                                        @method('delete')
                                        <button class="btn btn-danger btn-sm" style="margin-left: 2px" type="button"
                                            onclick="clickDos()"><i class='bx bx-trash'></i></button>
                                    </form>
                                    <a href="{{url('admin/dosen/'.$item->id)}}" class="btn btn-primary btn-sm" target="_blank" style="margin-left: 2px" rel="noopener noreferrer">
                                        <i class='bx bxs-graduation' ></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    function clickDos() {
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
              document.getElementById('hapusDosen').submit();
          }
      });
      
  }
</script>
@endsection