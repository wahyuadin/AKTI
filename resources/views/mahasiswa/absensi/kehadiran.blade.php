@extends('template.app')
@section('absensi', 'active open')
@section('absensi_kehadiran', 'active')

@section('content')
  <!-- Modal -->
  <div class="modal fade" id="tambahData" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">{{ config('app.name') }} || Tambah Data</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <form method="POST" action="{{ route('post.absensi.kehadiran') }}" enctype="multipart/form-data">
                @csrf
                  <div class="mb-3">
                    <label for="disabledTextInput" class="form-label">Nama Mahasiswa</label>
                    <input type="text" class="form-control" value="{{ Auth::user()->nama }}" disabled>
                  </div>
                  <div class="mb-3">
                    <label for="disabledTextInput" class="form-label">Nomor Induk</label>
                    <input type="text" class="form-control" value="{{ Auth::user()->nomor_induk }}" disabled>
                  </div>
                  <hr>
                  <div class="mb-3">
                    <label for="disabledSelect" class="form-label">Keterangan</label>
                    <select id="disabledSelect" name="keterangan" class="form-select">
                      <option selected disabled>== Pilih Salah Satu ==</option>
                      <option value="hadir">Hadir</option>
                      <option value="tidak hadir">Tidak Hadir</option>
                      <option value="izin">Izin</option>
                    </select>
                  </div>
                  <div class="mb-3">
                    <label for="disabledSelect" class="form-label">Status</label>
                    <select id="disabledSelect" name="status" class="form-select">
                      <option selected disabled>== Pilih Salah Satu ==</option>
                      <option value="datang">Datang</option>
                      <option value="pulang">Pulang</option>
                      <option value="lainnya">Lainnya</option>
                    </select>
                  </div>
                  <div class="mb-3">
                    <label for="disabledTextInput" class="form-label">Deskripsi</label>
                    <textarea name="deskripsi" class="form-control" id="" rows="5">{{ old('deskripsi') }}</textarea>
                  </div>
                  <div class="mb-3">
                    <label for="disabledTextInput" class="form-label">Bukti</label>
                    <input type="file" class="form-control" name="bukti">
                  </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
      </div>
    </div>
  </div>
  {{-- end modal --}}
<div class="card w-100 shadow p-3 mb-5 rounded border" >
    <div class="card-body">
        <div class="row">
            <div class="col-6 col-md-8">
                <h5 class="card-title">{{ $tanggal }}</h5>
            </div>
            <div class="col-6 col-md-4">
                <div class="d-flex justify-content-end">
                    <button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#tambahData" style="margin-left: 2px"><i class='bx bx-plus' ></i></button>
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
            <table id="example" class="table table-hover table-bordered">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Tanggal | Waktu</th>
                        <th>keterangan</th>
                        <th>Deskripsi</th>
                        <th>Status</th>
                        <th>Bukti</th>
                    </tr>
                </thead>
                <tbody>
                        @php
                            $no = 1;
                        @endphp
                        @foreach ($data as $item)
                        <tr>
                            <td>{{ $no++ }}</td>
                            <td>{{ $item->waktu }}</td>
                            <td>{{ $item->keterangan }}</td>
                            <td>{{ $item->deskripsi }}</td>
                            <td>{{ $item->status }}</td>
                            @if ($item->bukti != NULL)
                            <td>
                                <center><img src="{{ asset('assets/img/bukti/'. $item->bukti) }}" alt="{{ $item->bukti }}" width="60"></center>
                            </td>
                            @else
                            <td><center>-</center></td>
                            @endif
                        </tr>
                        @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection

