@extends('template.app')
@section('upload', 'active open')
@section('report_a3', 'active')
@section('content')

<!-- Modal -->
<div class="modal fade" id="tambah" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Tambah A3 Report</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form method="POST" action="" enctype="multipart/form-data">
            @csrf
            <div class="modal-body">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">A3 Report</label>
                    <input type="file" name="report_a3" class="form-control" accept=".pdf" multiple>
                    <div id="emailHelp" class="form-text">Format file A3 Report harus .pdf</div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" name="report_a3_submit" class="btn btn-primary">Submit</button>
            </div>
        </form>
      </div>
    </div>
  </div>
  {{-- end modal --}}
<div class="card w-100">
    <div class="card-body">
        <div id="adobe-dc-view"></div>
        <div class="row">
            <div class="col-6 col-md-8">
                <h5 class="card-title">{{ config('app.name') }} || A3 Report - {{ Auth::user()->nama }}</h5>
            </div>
            @if (!$mahasiswa->isEmpty())
                @if ($upload->isEmpty() || !$upload->first()->report_a3)
                <div class="col-6 col-md-4">
                    <div class="d-flex justify-content-end">
                        <button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#tambah" style="margin-left: 2px"><i class='bx bx-plus'></i></button>
                    </div>
                </div>
                @endif
            @endif
        </div>
        @if ($errors->any())
        <div class="alert alert-danger mt-3">
            @foreach ($errors->all() as $error)
                <p>{{ $error }}</p>
            @endforeach
        </div>
        @endif
        <div class="table-responsive mt-5">
            <table id="" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>A3 Report File</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @php
                        $no = 1;
                    @endphp
                    @if ($upload->isEmpty() || !$upload->first()->report_a3)
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    @else
                    @foreach ($upload as $data)
                    <tr>
                        <td>{{ $no++ }}</td>
                        <td>{{ $data->report_a3 }}</td>
                        <td>
                            <a href="{{ asset('assets/img/upload/' . $data->report_a3) }}" class="btn btn-primary btn-sm bx bxs-download"></a>
                            <a href="" class="btn btn-warning btn-sm bx bx-edit"></a>
                        </td>
                    </tr>
                    @endforeach
                    @endif
                </tbody>
            </table>
        </div>
    </div>
  </div>
@endsection
