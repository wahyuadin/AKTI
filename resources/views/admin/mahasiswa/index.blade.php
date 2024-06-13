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
            <h5>Table {{$title}}</h5>
            <div>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ImportModal">
                    <i class='bx bx-printer'></i>
                </button>

                <!-- Modal -->
                <div class="modal fade" id="ImportModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Cetak Data</h1>

                            </div>
                            <div class="modal-body">
                                <form action="{{url('')}}" method="post">
                                    @csrf
                                    <div class="mb-3">
                                        <select class="form-select" aria-label="Default select example">
                                            <option selected disabled>Pilih Waktu Cetak</option>
                                            <option value="Semua">Semua</option>
                                            @foreach ($batch as $b)
                                            <option value="{{$b}}">{{$b}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive text-nowrap">
                <table class="table table-hover table-bordered" id="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nama</th>
                            <th scope="col">No Registrasi</th>
                            <th scope="col">Departement</th>
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
                            <td>{{$item->user->nama}} - {{$item->user->nomor_induk}}</td>
                            <td>{{$item->noreg_vokasi}}</td>
                            <td>{{$item->mentor->section->departement->departement}}</td>
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

                                                </div>
                                                <div class="modal-body">
                                                    <form action="{{url('admin/mahasiswa/'.$item->id)}}" method="post">
                                                        @csrf
                                                        @method('put')
                                                        <div class="row">
                                                            <input type="text" name="user_id" value="{{$item->user_id}}"
                                                                hidden>
                                                            <div class="col-6">
                                                                <label for="exampleFormControlInput1"
                                                                    class="form-label">Nama
                                                                    Mahasiswa</label>
                                                                <input type="text" class="form-control"
                                                                    id="exampleFormControlInput1" name="nama"
                                                                    value="{{$item->user->nama}}" required>
                                                            </div>
                                                            <div class="col-6">
                                                                <label for="exampleFormControlInput1"
                                                                    class="form-label">Nomor Induk
                                                                    Mahasiswa</label>
                                                                <input type="number" class="form-control"
                                                                    id="exampleFormControlInput1" name="nomor_induk"
                                                                    value="{{$item->user->nomor_induk}}" required>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <label for="exampleFormControlInput1"
                                                                    class="form-label">No Registrasi
                                                                    Vokasi</label>
                                                                <input type="text" class="form-control"
                                                                    id="exampleFormControlInput1" name="noreg_vokasi"
                                                                    value="{{$item->noreg_vokasi}}" required>
                                                            </div>
                                                            <div class="col-6">
                                                                <label for="exampleFormControlInput1"
                                                                    class="form-label">Batch
                                                                    Vokasi</label>
                                                                <input type="number" class="form-control"
                                                                    id="exampleFormControlInput1" name="batch"
                                                                    value="{{$item->batch}}" required>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <label for="exampleFormControlInput1"
                                                                    class="form-label">Nama Mentor</label>
                                                                <select class="form-select"
                                                                    aria-label="Default select example" name="mentor"
                                                                    required>
                                                                    <option value="{{$item->mentor_id}}">
                                                                        {{$item->mentor->user->nama}}
                                                                    </option>
                                                                    @foreach ($mentor as $m)
                                                                    <option value="{{$m->id}}">
                                                                        {{$m->user->nama}}
                                                                    </option>
                                                                    @endforeach
                                                                </select>
                                                            </div>
                                                            <div class="col-6">
                                                                <label for="exampleFormControlInput1"
                                                                    class="form-label">Shop</label>
                                                                <input type="text" class="form-control"
                                                                    id="exampleFormControlInput1" name="shop"
                                                                    value="{{$item->shop}}" required>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <label for="exampleFormControlInput1"
                                                                    class="form-label">Divisi</label>
                                                                <input type="text" class="form-control"
                                                                    id="exampleFormControlInput1" name="divisi"
                                                                    value="{{$item->divisi}}" required>
                                                            </div>
                                                            <div class="col-6">
                                                                <label for="exampleFormControlInput1"
                                                                    class="form-label">Line</label>
                                                                <input type="text" class="form-control"
                                                                    id="exampleFormControlInput1" name="line"
                                                                    value="{{$item->line}}" required>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <label for="exampleFormControlInput1"
                                                                    class="form-label">Pos/Proses</label>
                                                                <input type="text" class="form-control"
                                                                    id="exampleFormControlInput1" name="pos"
                                                                    value="{{$item->pos}}" required>
                                                            </div>
                                                            <div class="col-6">
                                                                <label for="exampleFormControlInput1"
                                                                    class="form-label">Shift</label>
                                                                <select class="form-select"
                                                                    aria-label="Default select example" name="shift"
                                                                    required>
                                                                    <option value="{{$item->shift}}">{{$item->shift}}
                                                                    </option>
                                                                    <option value="Red">Red</option>
                                                                    <option value="White">White</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="mb-2">
                                                            <label for="exampleFormControlInput1"
                                                                class="form-label">Dosen
                                                                Pembimbing</label>
                                                            <select class="form-select"
                                                                aria-label="Default select example" name="dosen"
                                                                required>
                                                                <option value="{{$item->dosen_id}}">
                                                                    {{$item->dosen->user->nama}} -
                                                                    {{$item->dosen->user->nomor_induk}}</option>
                                                                @foreach ($dosen as $d)
                                                                <option value="{{$d->id}}">{{$d->user->nama}} -
                                                                    {{$d->user->nomor_induk}}</option>
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit" class="btn btn-primary">Simpan</button>
                                                </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <form action="{{url('admin/mahasiswa/'.$item->id)}}" method="post"
                                        id="hapusMahasiswa">
                                        @csrf
                                        @method('delete')
                                        <button class="btn btn-danger btn-sm" style="margin-left: 2px" type="button"
                                            onclick="clickHM()"><i class='bx bx-trash'></i></button>
                                    </form>
                                    <a href="{{url('admin/mahasiswa/'.$item->id)}}" class="btn btn-primary btn-sm"
                                        target="_blank" style="margin-left: 2px" rel="noopener noreferrer">
                                        <i class='bx bxs-detail'></i>
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