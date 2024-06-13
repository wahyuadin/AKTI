@extends('template.app')
@section('mahasiswa', 'active open')
@section('logbook', 'active')
@section('content')
<!-- Modal -->
{{-- add data --}}
<div class="modal fade" id="tambahData" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Tambah Data</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            @if ($mahasiswa->isEmpty())
            <form action="{{ route('logbook.mahasiswa.add_mentor') }}" method="POST">
                @csrf
                <div class="modal-body">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Mentor Vokasi</label>
                                <select class="form-select" aria-label="Default select example" name="mentor_id">
                                    <option selected disabled>Pilih Salah Satu</option>
                                    @foreach ($mentor as $mentor)
                                    <option value="{{ $mentor->id }}">Bpk. {{ $mentor->user->nama }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Dosen Pembimbing</label>
                                <select class="form-select" aria-label="Default select example" name="dosen_id">
                                    <option selected disabled>Pilih Salah Satu</option>
                                    @foreach ($dosen as $dosen)
                                    <option value="{{ $dosen->id }}">Bpk. {{ $dosen->user->nama }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">No Reg Vokasi</label>
                                <input type="number" class="form-control" name="noreg_vokasi" placeholder="No Reg Vokasi" required autofocus>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Batch</label>
                                <input type="number" class="form-control" name="batch" placeholder="Batch" required>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Divisi</label>
                                <input type="text" class="form-control" name="divisi" placeholder="Divisi" required>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Shop</label>
                                <input type="text" class="form-control" name="shop" placeholder="Shop" required>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Line</label>
                                <input type="text" class="form-control" name="line" placeholder="Line" required>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Pos</label>
                                <input type="text" class="form-control" name="pos" placeholder="Pos" required>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">Shift</label>
                                <select name="shift" class="form-select" required>
                                    <option selected disabled>== Pilih Salah Satu ==</option>
                                    <option value="white">WHITE</option>
                                    <option value="red">RED</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </form>
            @else
            <form action="{{ route('logbook.mahasiswa.add') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <input type="text" name="week" value="{{ $week }}" readonly hidden>
                <input type="text" name="mounth" value="{{ $mounth }}" readonly hidden>
                <div class="modal-body">
                    @foreach ($mahasiswa as $mhs)
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">Noreg Vokasi</label>
                        <input type="number"  class="form-control" required value="{{ $mhs->noreg_vokasi }}" disabled></input>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">Batch</label>
                        <input type="number" name="batch" class="form-control" required value="{{ $mhs->batch }}" disabled></input>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">Divisi</label>
                        <input type="text" name="divisi" class="form-control" required value="{{ $mhs->divisi }}" disabled></input>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">Shop</label>
                        <input type="text" name="shop" class="form-control" required value="{{ $mhs->shop }}" disabled></input>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">Line/Proses</label>
                        <input type="text" name="line" class="form-control" required value="{{ $mhs->line }}" disabled></input>
                    </div>

                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1"
                            class="form-label">Shift</label>
                        <select class="form-select" name="shift" disabled id="">
                            <option selected disabled>
                                {{ $mhs->shift == 'red' ? 'Red' : '' }}
                                {{ $mhs->shift == 'white' ? 'White' : '' }}
                            </option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">Pos</label>
                        <input type="text" class="form-control" required value="{{ $mhs->pos }}" disabled></input>
                    </div>
                    <hr>
                    @endforeach
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">Self Evaluation</label>
                        <select class="form-select" name="self_evaluation" id="">
                            <option selected disabled>Pilih Salah Satu</option>
                            <option value="1">1 - Poor</option>
                            <option value="2">2 - Enough</option>
                            <option value="3">3 - Good</option>
                            <option value="4">4 - Exelent</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">Keterangan</label>
                        <textarea type="text" name="keterangan" class="form-control" style="height: 180px" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">Gambar</label>
                        <input type="file" name="gambar" class="form-control" accept="image/*">
                        <p style="color: green">*Masukan gambar jika perlu.</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </form>
            @endif
        </div>
    </div>
</div>
{{-- end modal --}}

<div class="card w-100">
    <div class="card-body">
        <div id="adobe-dc-view"></div>
        <div class="row">
            <div class="col-6 col-md-8">
                <h5 class="card-title">Nama Mentor : {{ $mahasiswa->isEmpty() ? 'Data Tidak Tersedia':
                    $mahasiswa->first()->mentor->user->nama }}</h5>
            </div>
            <div class="col-6 col-md-4">
                <div class="d-flex justify-content-end">
                    @if (!$logbook->isEmpty())
                    <a href="{{ route('logbook.mahasiswa.print_all') }}" class="btn btn-secondary"><i class='bx bx-printer'></i></a>
                    @endif
                    <button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#tambahData"
                        style="margin-left: 2px"><i class='bx bx-plus'></i></button>
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
                        <th>Shop</th>
                        <th>Line/Proses</th>
                        <th>Week</th>
                        <th>Mounth</th>
                        <th>Keterangan</th>
                        <th>Dibuat</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($logbook as $data)
                    {{-- edit modal --}}
                    <div class="modal fade" id="ModalEdit{{ $data->id }}" tabindex="-1"
                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-xl">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">{{ config('app.name') }} || Edit
                                        Logbook</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <form method="POST" action="{{ route('logbook.mahasiswa.put', ['id' => $data->id]) }}" enctype="multipart/form-data">
                                    @csrf
                                    @method('PUT')
                                    <input type="text" value="{{ $data->id }}" name="id" hidden>
                                    <div class="modal-body">
                                        <div class="mb-3">
                                            <label for="exampleFormControlInput1" class="form-label">Shop</label>
                                            <input type="text" value="{{ $mahasiswa->value('shop') }}" class="form-control" disabled>
                                        </div>
                                        <div class="mb-3">
                                            <label for="exampleFormControlTextarea1" class="form-label">Noreg Vokasi</label>
                                            <input type="text" value="{{ $mahasiswa->value('noreg_vokasi') }}" class="form-control" disabled>
                                        </div>
                                        <div class="mb-3">
                                            <label for="exampleFormControlTextarea1" class="form-label">Batch</label>
                                            <input type="text" value="{{ $mahasiswa->value('batch') }}" class="form-control" disabled>
                                        </div>
                                        <div class="mb-3">
                                            <label for="exampleFormControlTextarea1" class="form-label">Divisi</label>
                                            <input type="text" value="{{ $mahasiswa->value('divisi') }}" class="form-control" disabled>
                                        </div>
                                        <div class="mb-3">
                                            <label for="exampleFormControlTextarea1" class="form-label">Line/Proses</label>
                                            <input type="text" value="{{ $mahasiswa->value('line') }}" class="form-control" disabled>
                                        </div>
                                        <br>
                                        <div class="mb-3">
                                            <label for="exampleFormControlTextarea1" class="form-label">Self
                                                Evaluation</label>
                                            <select class="form-select" name="self_evaluation" id="">
                                                <option selected disabled>Pilih Salah Satu</option>
                                                <option value="1" {{ $data->self_evaluation == 1 ? 'selected' : '' }}>1
                                                    - Poor</option>
                                                <option value="2" {{ $data->self_evaluation == 2 ? 'selected' : '' }}>2
                                                    - Enough</option>
                                                <option value="3" {{ $data->self_evaluation == 3 ? 'selected' : '' }}>3
                                                    - Good</option>
                                                <option value="4" {{ $data->self_evaluation == 4 ? 'selected' : '' }}>4
                                                    - Excellent</option>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="exampleFormControlTextarea1" class="form-label">Keterangan</label>
                                            <textarea type="text" name="keterangan" class="form-control" style="height: 180px" required>{{ $data->keterangan }}</textarea>
                                        </div>
                                        <div class="mb-3">
                                            <label for="exampleFormControlTextarea1" class="form-label">Gambar</label>
                                            @if ($data->gambar != null)
                                                <br>
                                                <img src="{{ asset('assets/img/logbook/' . $data->gambar) }}" width="30%">
                                            @endif
                                            <input type="file" name="gambar" class="form-control" accept="image/*">
                                            <p style="color: red">*Masukan gambar jika perlu.</p>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-primary">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    {{-- end modal --}}
                    {{-- show data modal --}}
                    <div class="modal fade" id="showdata{{ $data->id }}" tabindex="-1"
                        aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-xl">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Mentor Vokasi : Bpk {{
                                        $data->mahasiswa->mentor->user->nama }} || Tinjau Data</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <form action="" method="POST" enctype="multipart/form-data">
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="mb-3">
                                                    <label for="exampleFormControlTextarea1"
                                                        class="form-label">Shop</label>
                                                    <input type="text" value="{{ $data->mahasiswa->shop }}" class="form-control"
                                                        disabled placeholder="Masukan Tool Used"></input>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="mb-3">
                                                    <label for="exampleFormControlTextarea1" class="form-label">Noreg
                                                        Vokasi</label>
                                                    <input type="text" value="{{ $data->mahasiswa->noreg_vokasi }}"
                                                        class="form-control" disabled
                                                        placeholder="Masukan Tool Used"></input>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="mb-3">
                                                    <label for="exampleFormControlTextarea1"
                                                        class="form-label">Batch</label>
                                                    <input type="text" value="{{ $data->mahasiswa->batch }}" class="form-control"
                                                        disabled placeholder="Masukan Tool Used"></input>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="mb-3">
                                                    <label for="exampleFormControlTextarea1"
                                                        class="form-label">Divisi</label>
                                                    <input type="text" value="{{ $data->mahasiswa->divisi }}" class="form-control"
                                                        disabled placeholder="Masukan Tool Used"></input>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="mb-3">
                                                    <label for="exampleFormControlTextarea1"
                                                        class="form-label">Line</label>
                                                    <input type="text" value="{{ $data->mahasiswa->line }}" class="form-control"
                                                        disabled placeholder="Masukan Tool Used"></input>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="mb-3">
                                                    <label for="exampleFormControlTextarea1"
                                                        class="form-label">Shift</label>
                                                    <input type="text" value="{{ $data->mahasiswa->shift }}" class="form-control"
                                                        disabled placeholder="Masukan Tool Used"></input>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label for="exampleFormControlTextarea1"
                                                        class="form-label">Keterangan</label>
                                                    <textarea type="text" name="keterangan" class="form-control"
                                                        style="height: 180px" required
                                                        disabled>{{ $data->keterangan }}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label for="exampleFormControlTextarea1" class="form-label">Gambar</label>
                                                    @if ($data->gambar)
                                                        <br>
                                                        <img src="{{ asset('assets/img/logbook/'.$data->gambar) }}" width="25%">
                                                    @else
                                                        <p style="font-size: small"><i>Tidak ada gambar.</i></p>
                                                    @endif
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label for="exampleFormControlTextarea1" class="form-label">Tools
                                                        Used</label>
                                                    <input type="text" name="tool_used" value="{{ $data->tool_used }}"
                                                        class="form-control" disabled
                                                        placeholder="Masukan Tool Used"></input>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label for="exampleFormControlTextarea1"
                                                        class="form-label">Safety</label>
                                                    <input type="text" name="safety_key_point"
                                                        value="{{ $data->safety_key_point }}" class="form-control"
                                                        disabled placeholder="Masukan Tool Safety"></input>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label for="exampleFormControlTextarea1" class="form-label">Problem
                                                        Solf / Kaizen Point</label>
                                                    <input type="text" name="problem_solf"
                                                        value="{{ $data->problem_solf }}" class="form-control" disabled
                                                        placeholder="Problem Solf / Kaizen Point"></input>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label for="exampleFormControlTextarea1"
                                                        class="form-label">Hyarihatto</label>
                                                    <input type="text" name="hyarihatto" value="{{ $data->hyarihatto }}"
                                                        class="form-control" disabled
                                                        placeholder="Masukan Hyarihatto"></input>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Self Evaluation</label>
                                                    <label for="evaluation">Evaluation:</label>
                                                    <select class="form-control" disabled name="self_evaluation"
                                                        id="evaluation">
                                                        <option selected disabled>
                                                            {{ $data->self_evaluation == '1' ? '1 - Poor' : '' }}
                                                            {{ $data->self_evaluation == '2' ? '2 - Enough' : '' }}
                                                            {{ $data->self_evaluation == '3' ? '3 - Good' : '' }}
                                                            {{ $data->self_evaluation == '4' ? '4 - Excellent' : '' }}
                                                        </option>

                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Mentor Eveluation</label>
                                                    <select class="form-control" disabled name="mentor_eveluation"
                                                        id="">
                                                        <option selected disabled>
                                                            {{ $data->mentor_eveluation == '1' ? '1 - Poor' : '' }}
                                                            {{ $data->mentor_eveluation == '2' ? '2 - Enough' : '' }}
                                                            {{ $data->mentor_eveluation == '3' ? '3 - Good' : '' }}
                                                            {{ $data->mentor_eveluation == '4' ? '4 - Excellent' : '' }}
                                                        </option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label for="exampleFormControlTextarea1" class="form-label">Point To
                                                        Remember</label>
                                                    <textarea name="point_to_remember" class="form-control"
                                                        disabled>{{ $data->point_to_remember }}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="mb-3">
                                                    <label for="exampleFormControlTextarea1" class="form-label">Komentar
                                                        Mentor</label>
                                                    <textarea name="komentar_mentor" class="form-control"
                                                        disabled>{{ $data->komentar_mentor }}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    {{-- end modal --}}
                    <tr>
                        <td>{{ $no++ }}</td>
                        <td>{{ $data->mahasiswa->shop }}</td>
                        <td>{{ $data->mahasiswa->line }}</td>
                        <td>{{ $week }}</td>
                        <td>{{ $mounth }}</td>
                        <td>{{ $data->keterangan }}</td>
                        <td>{{ $data->created_at }}</td>
                        <td>
                            <span
                                class="badge rounded-pill <?php echo $data->status == 'accept' ? 'bg-success' : ($data->status == 'pending' ? 'bg-primary' : 'bg-danger');?>">
                                {{ $data->status }}
                            </span>
                        </td>
                        @if ($data->status == 'pending')
                        <td class="d-flex flex-column flex-sm-row">
                            <button data-bs-toggle="modal" data-bs-target="#ModalEdit{{ $data->id }}"
                                class="btn btn-warning btn-sm mb-2 mb-sm-0 me-sm-2 bx bx-edit"></button>
                            <a href="{{ route('logbook.mahasiswa.print', ['id' => $data->id]) }}" class="btn btn-primary btn-sm btn-sm mb-2 mb-sm-0 me-sm-2 bx bx-printer"></a>
                            {{-- <a href="{{ route('logbook.delete', $data->id) }}" class="btn btn-danger btn-sm"
                                data-confirm-delete="true"><i class="ti ti-trash"></i></a> --}}
                        </td>
                        @elseif($data->status == 'accept')
                        <td>
                            <button data-bs-toggle="modal" data-bs-target="#showdata{{ $data->id }}"
                                class="btn btn-success btn-sm mb-2 mb-sm-0 me-sm-2 bx bxs-show"></button>
                            <a href="{{ route('logbook.mahasiswa.print',['id' => $data->id]) }}" class="btn btn-primary btn-sm btn-sm mb-2 mb-sm-0 me-sm-2 bx bx-printer"></a>
                        </td>
                        @elseif ($data->status == 'reject')
                        <td>
                            <button data-bs-toggle="modal" data-bs-target="#showdata{{ $data->id }}"
                                class="btn btn-danger btn-sm mb-2 mb-sm-0 me-sm-2 bx bxs-show"></button>
                            <a href="{{ route('logbook.mahasiswa.print',['id' => $data->id]) }}" class="btn btn-primary btn-sm btn-sm mb-2 mb-sm-0 me-sm-2 bx bx-printer"></a>
                        </td>
                        @endif
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
