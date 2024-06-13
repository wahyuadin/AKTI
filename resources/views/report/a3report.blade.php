@extends('layouts.app')
@section('main')
<div class="container-xxl flex-grow-1 container-p-y">
    <div class="card shadow p-3 mb-5 rounded border">
        <div class="card-header d-flex justify-content-between">
            <h5>Tabel {{$title}}</h5>
            <form id="form" action="" method="post">
                @csrf
                <select class="form-select border border-primary" aria-label="Default select example" id="select"
                    name="batch">
                    <option selected>Filter Batch</option>
                    @foreach ($batch as $b)
                    <option value="{{$b}}">{{$b}}</option>
                    @endforeach
                </select>
            </form>
        </div>
        <div class="card-body">
            <div class="table-responsive text-nowrap">
                <table class="table table-hover table-bordered" id="table">
                    <thead>
                        <tr>
                            <th scope="col">No Registrasi</th>
                            <th scope="col">Nama</th>
                            <th scope="col">Departement</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider">
                        @foreach ($data as $item)
                        <tr>
                            <th scope="row">{{$item->mahasiswa->noreg_vokasi}}</th>
                            <td>{{$item->mahasiswa->user->nama}}</td>
                            <td>{{$item->mahasiswa->mentor->section->departement->departement}}</td>
                            <td>
                                <!-- Button trigger modal -->
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#ext{{$item->id}}">
                                    <i class='bx bxs-detail'></i>
                                </button>

                                <!-- Modal -->
                                <div class="modal fade" id="ext{{$item->id}}" tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                ...
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">Close</button>
                                                <button type="button" class="btn btn-primary">Save changes</button>
                                            </div>
                                        </div>
                                    </div>
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
    document.addEventListener('DOMContentLoaded', function () {
        // Ambil elemen select
        const selectElement = document.getElementById('select');
        
        // Tambahkan event listener untuk peristiwa perubahan
        selectElement.addEventListener('change', function () {
            // Dapatkan formulir
            const formElement = document.getElementById('form');
            
            // Kirim formulir
            formElement.submit();
        });
    });
</script>
@endsection