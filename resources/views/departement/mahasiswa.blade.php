@extends('layouts.app')
@section('main')
<div class="container-xxl flex-grow-1 container-p-y">
    <div class="card shadow p-3 mb-5 rounded border">
        <h5 class="card-header">Table {{$title}}</h5>
        <div class="card-body">
            <div class="table-responsive text-nowrap">
                <table class="table table-hover table-bordered" id="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nama</th>
                            <th scope="col">Section</th>
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
                            <td>
                                act
                            </td>
                            <td>
                                <a href="{{url('dosen/mahasiswa/'.$item->id)}}" target="_blank"
                                    rel="noopener noreferrer" class="btn btn-primary btn-sm"><i
                                        class='bx bxs-graduation'></i></a>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection