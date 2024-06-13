@extends('template.app')
@section('data', 'active open')
@section('list_mahasiswa', 'active')
@section('content')

<div class="card w-100">
    <div class="card-body">
        <div id="adobe-dc-view"></div>
        <div class="row">
            <div class="col-6 col-md-8">
                <h5 class="card-title">{{ config('app.name') }} || List Mahasiswa Bimbingan : {{ Auth::user()->nama }}</h5>
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
                        <th>Apply Pada</th>
                    </tr>
                </thead>
                <tbody>
                    @php
                        $no = 1;
                    @endphp
                @foreach ($mentor as $data)
                <tr>
                    <td>{{ $no++ }}</td>
                    <td>{{ $data->user->nama }}</td>
                    <td>{{ $data->user->nomor_induk }}</td>
                    <td>{{ $data->mentor->user->nama }}</td>
                    <td>
                        <span class="badge rounded-pill bg-secondary">{{ $data->updated_at }}</span>
                    </td>
                </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
  </div>
@endsection
