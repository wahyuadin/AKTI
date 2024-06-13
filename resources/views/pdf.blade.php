<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ config('app.name') }}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
  <body>
    <style>
        #tabel {
            border: 1px solid black;
            border-collapse: collapse;
            font-family: 'Times New Roman', Times, serif;
        }
        .page-break {
            page-break-before: always;
        }
    </style>
    @foreach ($data as $data)
    <table class="table table-borderless">
        <tr>
            <th>
                {{-- public_path --}}
                <img src="{{ public_path('assets/img/logo-akti.png') }}" width="200" height="auto" class="img-fluid" alt="">
            </th>
            <th>
                <h5 class="text-end" style="font-size: 15px; margin:0%; padding:0%;"><b>Unit Pelatihan Kerja</b></h5>
                <h5 class="text-end" style="font-size: 14px; margin:0%; padding:0%;"><b>PT Toyota Motor Manufacturing Indonesia</b><br>
                    <p class="text-end" style="font-size: 9px; margin:0%; padding:0%;">Kawasan Industri KIIC Lot DD 1, Jl.Permata Raya, Karawang Barat<br>Sirnabaya, Telukjambe Timur, Karawang Jawa Barat 41361</p>
                </h5>
            </th>
        </tr>
    </table>
        <h5 class="mb-3 mt-5"><center><b>LOGBOOK PESERTA PEMAGANGAN</b></center></h5>
        <table id="tabel" style="width: 100%;">
            <tr>
                <th id="tabel" style="padding: 3px;">SHOP</th>
                <td id="tabel" style="padding: 3px;">{{ $data->mahasiswa->shop }}</td>
                <th id="tabel" style="padding: 3px;">WEEK</th>
                <td id="tabel" style="padding: 3px;">{{ $data->week }}</td>
            </tr>
            <tr>
                <th id="tabel" style="padding: 3px;">LINE / PROSES</th>
                <td id="tabel" style="padding: 3px;">{{ $data->mahasiswa->line }}</td>
                <th id="tabel" style="padding: 3px;">MOUNTH</th>
                <td id="tabel" style="padding: 3px;">{{ $data->mounth }}</td>
            </tr>
            <tr>
                <td colspan="4">
                    <p style="{{ $data->gambar ? 'margin-left:10px' : 'margin-bottom: 20%; padding:5px' }}">
                        {{ $data->keterangan }}
                    </p>
                    @if ($data->gambar)
                        <center><img src="{{ public_path('assets/img/logbook/' . $data->gambar) }}" width="200"></center>
                    @endif
                </td>
            </tr>
            <tr>
                <td id="tabel"><center>Tools Used</center></td>
                <td id="tabel"><center>Safety Key Point</center></td>
                <td id="tabel"><center>Problem Solf / Kaizen Point</center></td>
                <td id="tabel"><center>Hyarihatto</center></td>
            </tr>
            @if ($data->tool_used && $data->safety_key_point && $data->problem_solf && $data->hyarihatto)
            <tr>
                <td id="tabel" style="padding: 30px"><center>{{ $data->tool_used }}</center></td>
                <td id="tabel" style="padding: 30px"><center>{{ $data->safety_key_point }}</center></td>
                <td id="tabel" style="padding: 30px"><center>{{ $data->problem_solf }}</center></td>
                <td id="tabel" style="padding: 30px"><center>{{ $data->hyarihatto }}</center></td>
            </tr>
            @else
            <tr>
                <td id="tabel" style="padding: 50px;"></td>
                <td id="tabel" style="padding: 50px;"></td>
                <td id="tabel" style="padding: 50px;"></td>
                <td id="tabel" style="padding: 50px;"></td>
            </tr>

            @endif
            <tr>
                <td id="tabel" colspan="3">
                    <table style="width: 100%;">
                        <tbody>
                            <tr>
                                <td style="width: 90%;" id="table">
                                    <table style="width: 100%;">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <p  class="form-label" style="margin-left: 10px; margin: 0;">Point To Remember: <br>
                                                    </p>
                                                    <textarea name="" class="form-control" style="border: none; margin-right: 90%; resize: none;" rows="2">{{ $data->point_to_remember }}</textarea>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                                <td style="padding: 0;">
                                    <table style="width: 100%;">
                                        <tbody>
                                            <tr>
                                                <td style="border: 1px solid black; border-collapse: collapse; border-top: none; font-size: small; width: 20%; padding: 3px;">
                                                    <center>1</center>
                                                </td>
                                                <td style="border-right: none; font-size: small; padding: 1px;">
                                                    <center>Poor</center>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td
                                                    style="border: 1px solid black; border-collapse: collapse; font-size: small; padding: 3px;">
                                                    <center>2</center>
                                                </td>
                                                <td
                                                    style="border: 1px solid black; border-collapse: collapse; border-right: none; font-size: small; padding: 3px; ">
                                                    <center>Enough</center>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td
                                                    style="border: 1px solid black; border-collapse: collapse; font-size: small; padding: 3px;">
                                                    <center>3</center>
                                                </td>
                                                <td
                                                    style="border: 1px solid black; border-collapse: collapse; font-size: small; padding: 3px; border-bottom: none; border-right: none;">
                                                    <center>Good</center>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td
                                                    style="border: 1px solid black; border-collapse: collapse; font-size: small; padding: 3px; border-bottom: none;">
                                                    <center>4</center>
                                                </td>
                                                <td
                                                    style="border: 1px solid black; border-collapse: collapse; font-size: small; padding: 3px; border-right: none; border-bottom: none;">
                                                    <center>Excellent</center>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
                <td style="padding: 0;">
                    <table style="width: 100%;">
                        <tbody>
                            <tr>
                                <td colspan="4" style="padding: 1px;">
                                    <center>Self Evaluation</center>
                                </td>
                            </tr>
                            <tr>
                                <td style="border: 1px solid black; border-collapse: collapse; border-left: none; font-size: small;">
                                    <center>
                                        @if ($data->self_evaluation == '1')
                                            <input type="radio" checked>
                                        @else
                                            <b>1</b>
                                        @endif
                                    </center>
                                </td>
                                <td style="border: 1px solid black; border-collapse: collapse; border-left: none; font-size: small;">
                                    <center>
                                        @if ($data->self_evaluation == '2')
                                            <input type="radio" checked>
                                        @else
                                            <b>2</b>
                                        @endif
                                    </center>
                                </td>
                                <td style="border: 1px solid black; border-collapse: collapse; border-left: none; font-size: small;">
                                    <center>
                                        @if ($data->self_evaluation == '3')
                                            <input type="radio" checked>
                                        @else
                                            <b>3</b>
                                        @endif
                                    </center>
                                </td>
                                <td style="border: 1px solid black; border-collapse: collapse; border-right: none; font-size: small;">
                                    <center>
                                        @if ($data->self_evaluation == '4')
                                            <input type="radio" checked>
                                        @else
                                            <b>4</b>
                                        @endif
                                    </center>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table style="width: 100%;">
                        <tbody>
                            <tr>
                                <td colspan="4" style="padding: 2px;">
                                    <center>Mentor Evaluation</center>
                                </td>
                            </tr>
                            <tr>
                                <td
                                    style="border: 1px solid black; border-collapse: collapse; border-left: none; border-bottom: none; font-size: small;">
                                    <center>
                                        @if ($data->mentor_eveluation == '1')
                                            <input type="radio" checked>
                                        @else
                                            <b>1</b>
                                        @endif
                                    </center>
                                </td>
                                <td
                                    style="border: 1px solid black; border-collapse: collapse; border-left: none; border-bottom: none; font-size: small;">
                                    <center>
                                        @if ($data->mentor_eveluation == '2')
                                            <input type="radio" checked>
                                        @else
                                            <b>2</b>
                                        @endif
                                    </center>
                                </td>
                                <td
                                    style="border: 1px solid black; border-collapse: collapse; border-left: none; border-bottom: none; font-size: small;">
                                    <center>
                                        @if ($data->mentor_eveluation == '3')
                                            <input type="radio" checked>
                                        @else
                                            <b>3</b>
                                        @endif
                                    </center>
                                </td>
                                <td
                                    style="border: 1px solid black; border-collapse: collapse; border-right: none; border-bottom: none; font-size: small;">
                                    <center>
                                        @if ($data->mentor_eveluation == '4')
                                            <input type="radio" checked>
                                        @else
                                            <b>4</b>
                                        @endif
                                    </center>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr id="table">
                <td colspan="3" style="border: 1px solid black; border-top: none;">
                    <div style="margin-left: 10px; margin-right: 10px;">
                        <label class="form-label">Komentar Mentor :</label>
                        <textarea class="form-control"
                            style="height: 100px; border: none; resize: none;">{{ $data->komentar_mentor }}</textarea>
                    </div>
                </td>
                <td style="text-align: center; border: 1px solid black;">
                    <div style="margin-left: 10px; margin-right: 10px;">
                        <label class="form-label">Paraf Mentor</label>
                        <center>
                            @if ($data->komentar_mentor && $paraf)
                            <img src="{{ public_path('assets/img/paraf/'. $paraf) }}" width="200" style="margin-bottom: 10px">
                            @else
                            <p style="margin-top: 65%"></p>
                            @endif
                        </center>
                    </div>
                </td>
            </tr>
        </table>
        <div class="page-break"></div>
    @endforeach
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
