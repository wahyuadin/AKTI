@extends('template.app')
@section('absensi', 'active open')
@section('absen', 'active')

@section('content')
<div class="card w-100">
    <div class="card-body">
        <div id="adobe-dc-view"></div>
        <div class="row">
            <div class="col-6 col-md-8">
                <h5 class="card-title">{{ config('app.name') }} || List Absen Mahasiswa</h5>
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
                        <th>Nama Mahasiswa</th>
                        <th>Nomor Induk</th>
                        <th>Keterangan</th>
                        <th>Deskripsi</th>
                        <th>Status</th>
                        <th>Bukti</th>
                        <th>Waktu</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @php
                        $no = 1;
                    @endphp
                    {{-- @dd($absensi) --}}
                    @foreach ($absensi as $data)
                    <!-- Modal ACC -->
                    <div class="modal fade" id="izin{{ $data->id }}" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">{{ config('app.name') }} || Konfirmasi Izin</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Apakah Anda Yakin ?
                                <form action="{{ route('absensi_mahasiswa_accept', ['id' => $data->id]) }}" method="POST">
                                    @csrf
                                    @method('PUT')
                            </div>
                            <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                            <button type="submit" class="btn btn-primary">Yes</button>
                        </form>
                            </div>
                        </div>
                        </div>
                    </div>
                    {{-- end modal --}}
                    <!-- Modal REJECT -->
                    <div class="modal fade" id="reject{{ $data->id }}" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">{{ config('app.name') }} || Reject Absen</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Apakah Anda Yakin ?
                                <form action="{{ route('absensi_mahasiswa_reject',['id' => $data->id]) }}" method="POST">
                                    @csrf
                                    @method('PUT')
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                <button type="submit" class="btn btn-primary">Yes</button>
                            </form>
                            </div>
                        </div>
                        </div>
                    </div>
                    {{-- end modal --}}
                    <tr>
                        <td>{{ $no++ }}</td>
                        <td>{{ $data->mahasiswa->user->nama }}</td>
                        <td>{{ $data->mahasiswa->user->nomor_induk }}</td>
                        <td>{{ $data->keterangan }}</td>
                        <td>{{ $data->deskripsi }}</td>
                        <td>{{ $data->status }}</td>
                        <td>
                            @if ($data->bukti == null)
                                <center>-</center>
                            @else
                                <img src="{{ asset('assets/img/bukti/'.$data->bukti) }}" width="100">
                            @endif
                        </td>
                        <td>{{ $data->waktu }}</td>
                        <td>
                            @if ($data->deskripsi_keterangan == 'pulang cepat')
                                <button type="button" class="btn btn-primary btn-sm mb-2 mb-sm-0 me-sm-2" data-bs-toggle="modal" data-bs-target="#izin{{ $data->id }}">Izin</button>
                                <button type="button" class="btn btn-danger btn-sm mb-2 mb-sm-0 me-sm-2" data-bs-toggle="modal" data-bs-target="#reject{{ $data->id }}">Tidak Izin</button>
                            @endif
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
  </div>

@endsection
