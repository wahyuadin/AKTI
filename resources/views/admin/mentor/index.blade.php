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
                            <td>{{$item->user->nama}} - {{$item->no_telp}}</td>
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
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Edit data</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="{{url('admin/mentor/'.$item->id)}}" method="post">
                                                        @csrf
                                                        @method('put')
                                                        <input type="text" name="user_id" value="{{$item->user->id}}" hidden>
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <label for="exampleFormControlInput1"
                                                                    class="form-label">Nama</label>
                                                                <input type="text" class="form-control"
                                                                    id="exampleFormControlInput1" name="nama"
                                                                    value="{{$item->user->nama}}" required>
                                                            </div>
                                                            <div class="col-6">
                                                                <label for="exampleFormControlInput1"
                                                                    class="form-label">Email</label>
                                                                <input type="email" class="form-control"
                                                                    id="exampleFormControlInput1" name="email"
                                                                    value="{{$item->user->email}}" required>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <label for="exampleFormControlInput1"
                                                                    class="form-label">No
                                                                    Telp</label>
                                                                <input type="text" class="form-control"
                                                                    id="exampleFormControlInput1" name="no_telp"
                                                                    value="{{$item->no_telp}}" required>
                                                            </div>
                                                            <div class="col-6">
                                                                <label for="exampleFormControlInput1"
                                                                    class="form-label">Leader</label>
                                                                <input type="text" class="form-control"
                                                                    id="exampleFormControlInput1" name="leader"
                                                                    value="{{$item->leader}}" required>
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
                                    <form action="{{url('admin/mentor/'.$item->id)}}" method="post" id="hapus-mentor">
                                        @csrf
                                        @method('delete')
                                        <button class="btn btn-danger btn-sm" style="margin-left: 2px" type="button"
                                            onclick="HMentor()"><i class='bx bx-trash'></i></button>
                                    </form>
                                    <a href="{{url('admin/mentor/'.$item->id)}}" style="margin-left:2px" target="_blank"
                                        rel="noopener noreferrer" class="btn btn-primary btn-sm"><i
                                            class='bx bxs-graduation'></i></a>
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
    function HMentor() {
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
              document.getElementById('hapus-mentor').submit();
          }
      });
      
  }
</script>
@endsection