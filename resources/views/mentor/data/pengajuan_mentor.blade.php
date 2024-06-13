@extends('template.app')
@section('data', 'active open')
@section('pengajuan_mentor', 'active')
@section('content')

<div class="card w-100">
    <div class="card-body">
        <div id="adobe-dc-view"></div>
        <div class="row">
            <div class="col-6 col-md-8">
                <h5 class="card-title">{{ config('app.name') }} || Pengajuan Mentor Vokasi</h5>
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
                        <th>Mentor</th>
                        <th>Pengajuan Mentor</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    {{-- @dd($pengajuan_mentor) --}}
                </thead>
                <tbody>
                    @php
                        $no = 1;
                    @endphp
                @foreach ($pengajuan_mentor as $data)
                <tr>
                    <td>{{ $no++ }}</td>
                    <td>{{ $data->mahasiswa->user->nama }}</td>
                    <td>{{ $data->mahasiswa->user->nomor_induk }}</td>
                    <td>{{ $data->mentorPertama->user->nama }}</td>
                    <td>{{ $data->mentorKedua->user->nama }}</td>
                    @if (strtolower($data->status) == 'reject')
                    <td>
                        <span class="badge rounded-pill bg-danger">{{ $data->status }}</span>
                    </td>
                    <td></td>
                    @elseif (strtolower($data->status) == 'accept')
                    <td>
                        <span class="badge rounded-pill bg-primary">{{ $data->status }}</span>
                    </td>
                    <td class="d-flex flex-column flex-sm-row">
                        <button type="button" data-bs-toggle="modal" data-bs-target="#reject{{ $data->id }}" class="btn btn-primary btn-sm btn-sm mb-2 mb-sm-0 me-sm-2 bx bx-x"></button>
                    </td>
                    @else
                    <td>
                        <span class="badge rounded-pill bg-secondary">{{ $data->status }}</span>
                    </td>
                    <td class="d-flex flex-column flex-sm-row">
                        <button type="button" data-bs-toggle="modal" data-bs-target="#acc{{ $data->id }}" class="btn btn-warning btn-sm mb-2 mb-sm-0 me-sm-2 bx bx-check"></button>
                        <button type="button" data-bs-toggle="modal" data-bs-target="#reject{{ $data->id }}" class="btn btn-primary btn-sm btn-sm mb-2 mb-sm-0 me-sm-2 bx bx-x"></button>
                    </td>
                    @endif
                </tr>
                  <!-- acc -->
                <div class="modal fade" id="acc{{ $data->id }}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">{{ config('app.name') }} || Confirm</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="" method="POST">
                        @csrf
                        <div class="modal-body">
                            <p>Apakah Anda Yakin Untuk Accept User ?</p>
                            <input type="text" name="status" value="accept" hidden>
                            <input type="text" name="id" value="{{ $data->id }}" hidden>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
                            <button type="submit" name="button_accept" class="btn btn-primary">YES</button>
                        </div>
                        </form>
                    </div>
                    </div>
                </div>
                {{-- end modal --}}
                <!-- Reject -->
                <div class="modal fade" id="reject{{ $data->id }}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">{{ config('app.name') }} || Reject</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="" method="POST">
                        @csrf
                        <div class="modal-body">
                            <p>Apakah Anda Yakin Untuk Reject User ?</p>
                            <input type="text" name="status" value="reject" hidden>
                            <input type="text" name="id" value="{{ $data->id }}" hidden>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
                            <button type="submit" name="button_reject" class="btn btn-primary">YES</button>
                        </div>
                        </form>
                    </div>
                    </div>
                </div>
                {{-- end modal --}}
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
  </div>
@endsection
