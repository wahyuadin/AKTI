@extends('layouts.app')
@section('main')
<div class="container-xxl flex-grow-1 container-p-y">
    @if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
            {{ $error }}
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
            <h5>Table {{$title}}</h5>
            <div class="d-flex">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ImportModal">
                    <i class='bx bx-import' style="margin-right: 2px"></i>
                </button>

                <!-- Modal -->
                <div class="modal fade" id="ImportModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Import Data</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                                    style="margin-right:2px"></button>
                            </div>
                            <div class="modal-body">
                                <form action="{{url('admin/pengguna/import')}}" method="post"
                                    enctype="multipart/form-data">
                                    @csrf
                                    <div class="mb-3">
                                        <label for="validationCustom01" class="form-label">Upload file</label>
                                        <input class="form-control" type="file" name="file" id="validationCustom01"
                                            required>
                                        <div id="emailHelp" class="form-text">Format file wajib xls atau xlsx. <a
                                                href="{{url('admin/pengguna/unduh-template')}}"> Unduh disini</a>
                                        </div>
                                    </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <i class='bx bx-add-to-queue'></i>
                </button>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Tambah Data</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="" method="post">
                                    @csrf
                                    <div class="row">
                                        <div class="col-6">
                                            <label for="exampleFormControlInput1" class="form-label">Nama</label>
                                            <input type="text" class="form-control" id="exampleFormControlInput1"
                                                name="nama" required>
                                        </div>
                                        <div class="col-6">
                                            <label for="exampleFormControlInput1" class="form-label">Nomor Induk
                                            </label>
                                            <input type="number" class="form-control" id="exampleFormControlInput1"
                                                name="nomor_induk" required>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <label for="exampleFormControlInput1" class="form-label">Email</label>
                                            <input type="email" class="form-control" id="exampleFormControlInput1"
                                                name="email" required>
                                        </div>
                                        <div class="col-6">
                                            <label for="exampleFormControlInput1" class="form-label">Role</label>
                                            <select class="form-select" aria-label="Default select example" name="role"
                                                required>
                                                <option value="departement">departement</option>
                                                <option value="section">section</option>
                                                <option value="mentor">mentor</option>
                                                <option value="mahasiswa">mahasiswa</option>
                                            </select>
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
            </div>

        </div>
        <div class="card-body table-responsive">
            <table class="table table-hover table-bordered" id="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Nama</th>
                        <th scope="col">Nomor Induk</th>
                        <th scope="col">Email</th>
                        <th scope="col">Role</th>
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
                        <td>{{$item->nama}}</td>
                        <td>{{$item->nomor_induk}}</td>
                        <td>{{$item->email}}</td>
                        <td>{{$item->role}}</td>
                        <td>
                            <div class="d-flex">
                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-warning btn-sm" data-bs-toggle="modal"
                                    data-bs-target="#t{{$item->id}}">
                                    <i class='bx bx-edit'></i>
                                </button>

                                <!-- Modal -->
                                <div class="modal fade" id="t{{$item->id}}" tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="exampleModalLabel">Edit Data</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="{{url('admin/pengguna/'.$item->id)}}" method="post">
                                                    @csrf
                                                    @method('put')
                                                    <div class="row">
                                                        <div class="col-6">
                                                            <label for="exampleFormControlInput1"
                                                                class="form-label">Nama</label>
                                                            <input type="text" class="form-control"
                                                                id="exampleFormControlInput1" name="nama"
                                                                value="{{$item->nama}}" required>
                                                        </div>
                                                        <div class="col-6">
                                                            <label for="exampleFormControlInput1"
                                                                class="form-label">Nomor Induk
                                                            </label>
                                                            <input type="text" class="form-control"
                                                                id="exampleFormControlInput1" name="nomor_induk"
                                                                value="{{$item->nomor_induk}}" required>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-6">
                                                            <label for="exampleFormControlInput1"
                                                                class="form-label">Email</label>
                                                            <input type="email" class="form-control"
                                                                id="exampleFormControlInput1" name="email"
                                                                value="{{$item->email}}" required>
                                                        </div>
                                                        <div class="col-6">
                                                            <label for="exampleFormControlInput1"
                                                                class="form-label">Role</label>
                                                            <select class="form-select"
                                                                aria-label="Default select example" name="role"
                                                                required>
                                                                <option value="{{$item->role}}">{{$item->role}}</option>
                                                                <option value="departement">departement
                                                                </option>
                                                                <option value="section">section</option>
                                                                <option value="mentor">mentor</option>
                                                                <option value="mahasiswa">mahasiswa</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
                                            </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <form action="{{url('admin/pengguna/'.$item->id)}}" method="post" id="hpsD">
                                    @csrf
                                    @method('delete')
                                    <button class="btn btn-danger btn-sm" type="button" style="margin-left: 2px"
                                        onclick="btnD()"><i class='bx bx-trash'></i></button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    function btnD() {
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
              document.getElementById('hpsD').submit();
          }
      });
      
  }
</script>
@endsection