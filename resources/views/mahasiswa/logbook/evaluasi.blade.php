@extends('template.app')
@section('mahasiswa', 'active open')
@section('evaluasi', 'active')
@section('content')
  <!-- Modal -->
  {{-- add data --}}
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Tambah Data</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="" method="POST">
        @csrf
        <div class="modal-body">
            <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">Shop</label>
                <input type="text" name="shop" class="form-control" required placeholder="Masukan Shop">
            </div>
            <div class="mb-3">
                <label for="exampleFormControlTextarea1" class="form-label">Line/Proses</label>
                <input type="text" name="line" class="form-control" required placeholder="Masukan line"></input>
            </div>
            <div class="mb-3">
                <label for="exampleFormControlTextarea1" class="form-label">Konten</label>
                <textarea type="text" name="pos" class="form-control" style="height: 180px" required></textarea>
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" name="add" class="btn btn-primary">Save</button>
        </div>
        </form>
      </div>
    </div>
  </div>

<div class="card w-100">
    <div class="card-body">
        <div id="adobe-dc-view"></div>
        <div class="row">
            <div class="col-6 col-md-8">
                <h5 class="card-title">Section Head : {{ $faker->name() }}</h5>
            </div>
            <div class="col-6 col-md-4">
                <div class="d-flex justify-content-end">
                    <button type="submit" class="btn btn-secondary"><i class='bx bx-printer'></i></button>
                    <button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#exampleModal" style="margin-left: 2px"><i class='bx bx-plus' ></i></button>
                </div>
            </div>
        </div>
        @if ($errors->any())
        <div class="alert alert-danger mt-3">
            @foreach ($errors->all() as $error)
                <p>{{ $error }}</p>
            @endforeach
        </div>
        @endif
        <div class="table-responsive mt-5">
            <table id="example" class="table table-striped table-bordered" style="width:100%">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama</th>
                        <th>Noreg</th>
                        <th>Priode</th>
                        <th>Divisi</th>
                        <th>Departement</th>
                        <th>Section</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                {{-- edit modal --}}
                {{-- <div class="modal fade" id="ModalEdit{{ $data->id }}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Edit Data</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="" method="POST">
                        @csrf
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Shop</label>
                                <input type="text" name="id" value="{{ $data->id }}" class="form-control" required placeholder="Masukan Shop" hidden readonly>
                                <input type="text" name="shop" value="{{ $data->shop }}" class="form-control" required placeholder="Masukan Shop">
                            </div>
                            <div class="mb-3">
                                <label for="exampleFormControlTextarea1" class="form-label">Line/Proses</label>
                                <input type="text" name="line" value="{{ $data->line }}" class="form-control" required placeholder="Masukan line"></input>
                            </div>
                            <div class="mb-3">
                                <label for="exampleFormControlTextarea1" class="form-label">Content</label>
                                <textarea type="text" name="content" class="form-control" required style="height: 180px">{{ $data->pos }}</textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                        <button type="submit" name="edit" class="btn btn-primary">Save</button>
                        </div>
                        </form>
                    </div>
                    </div>
                </div> --}}
                {{-- end modal --}}
                @foreach(range(1, 1000) as $index)
                <tr>
                    <td>{{ $index }}</td>
                    <td>{{ $faker->name() }}</td>
                    <td>{{ $faker->randomNumber(5, true) }}</td>
                    <td>{{ $faker->date('Y-m-d') }} s/d {{ $faker->date('Y-m-d') }}</td>
                    <td>{{ $faker->jobTitle() }}</td>
                    <td>{{ $faker->catchPhrase() }}</td>
                    <td>{{ $faker->bs() }}</td>
                    <td class="d-flex flex-column flex-sm-row">
                        <a href="pdf" class="btn btn-success btn-sm btn-sm mb-2 mb-sm-0 me-sm-2 bx bxs-show"></a>
                        <button data-bs-toggle="modal" data-bs-target="#ModalEdit" class="btn btn-warning btn-sm mb-2 mb-sm-0 me-sm-2 bx bx-edit"></button>
                        {{-- <a href="{{ route('logbook.delete', $data->id) }}" class="btn btn-danger btn-sm" data-confirm-delete="true"><i class="ti ti-trash"></i></a> --}}
                    </td>
                </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
  </div>
@endsection
