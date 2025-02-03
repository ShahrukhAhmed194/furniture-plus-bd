@extends('back.layouts.master')
@section('title', 'SMS Settings')

@section('master')
    <!-- Begin Page Content -->
    <div class="card shadow mb-3">
        <div class="card-header py-3">
            <h5 class="m-0 font-weight-bold text-info d-inline-block"><i class="fas fa-fw fa-edit"></i> SMS Configuration</h5>
            <label class="switch float-right"><input type="checkbox" class="appStatus" data-group="sms" data-name="smsStatus" {{ (\App\Traits\SMSTrait::web('sms', 'smsStatus')) ? 'checked' : '' }}><span class="slider round"></span></label>
        </div>

        <div class="card-body">
            <form method="post" action="{{ route('back.smsInfoUpdate') }}"
                  enctype="multipart/form-data">
                @csrf
                @method('post')
                <input type="hidden" name="group" value="sms">
                <div class="form-group">
                    <label><b>Provider</b></label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="smsProvider" id="Radios1" value="infobuzzer" {{ (\App\Traits\SMSTrait::web('sms', 'smsProvider') == 'infobuzzer') ? 'checked' : '' }}>
                        <label class="form-check-label" for="Radios1">
                            Infobuzzer
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="smsProvider" id="Radios2" value="mshastra" {{ (\App\Traits\SMSTrait::web('sms', 'smsProvider') == 'mshastra') ? 'checked' : '' }}>
                        <label class="form-check-label" for="Radios2">
                            Mobishastra
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="smsProvider" id="Radios3" value="103.69.149.50" {{ (\App\Traits\SMSTrait::web('sms', 'smsProvider') == '103.69.149.50') ? 'checked' : '' }}>
                        <label class="form-check-label" for="Radios3">
                            103.69.149.50
                        </label>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-xl-6">
                        <label><b>Username</b></label>
                        <input autocomplete="off" name="username" type="text" min="0" class="form-control"
                               value="{{ \App\Traits\SMSTrait::web('sms', 'username') }}"
                               required>
                    </div>
                    <div class="form-group col-xl-6">
                        <label><b>Password</b></label>
                        <input autocomplete="off" name="password" type="password" min="0" class="form-control"
                               value="{{ \App\Traits\SMSTrait::web('sms', 'password') }}">
                    </div>
                    <div class="form-group col-xl-12">
                        <button type="submit" class="btn btn-info btn-block" id="update">Update
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="card shadow mb-3">
        <div class="card-header py-3">
            <h5 class="m-0 font-weight-bold text-info d-inline-block"><i class="fas fa-fw fa-edit"></i> SMS Templates</h5>
            <button class="btn btn-info btn-sm float-right" data-toggle="modal" data-target="#addSMS"><i class="fas fa-plus"></i> Add New</button>
        </div>
        <div class="card-body">
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Massage</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody class="text-dark">
                @foreach($query as $data)
                    <tr>
                        <td style="width: 300px;">
                            <input type="text" class="form-control tempName" value="{{ $data->name }}">
                        </td>
                        <td>
                            <input type="text" class="form-control tempMassage" value="{{ $data->value }}">
                        </td>
                        <td>
                            @include('switcher::switch', [
                                'table' => 'apps',
                                'data' => $data,
                                'column' => 'status', // Optional
                            ])
                        </td>
                        <td>
                            <button class="btn btn-info updateTemplate" data-id="{{ $data->id }}"><i class="fas fa-upload"></i></button>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="addSMS" tabindex="-1" role="dialog" aria-labelledby="addSMSLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form action="{{ route('back.addSMSTemplate') }}" method="post">
                    @csrf
                    <div class="modal-header">
                        <h5 class="modal-title" id="addSMSLabel"><b>New Template</b></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label><b>Name</b></label>
                            <input type="text" class="form-control tempName" name="name" required>
                        </div>

                        <div class="form-group">
                            <label><b>Massage</b> <span class="text-danger">(Max 160 characters)</span></label>
                            <textarea class="form-control" rows="4" maxlength="160" name="massage" required></textarea>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-info btn-sm send">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@section('footer')
    <script>
        // Update Template
        $(document).on('click', '.updateTemplate', function () {
            let id = $(this).data('id');
            let name = $(this).closest('tr').find('.tempName').val();
            let massage = $(this).closest('tr').find('.tempMassage').val();
            let _token = '{{ csrf_token() }}';

            if(name != '' && massage != ''){
                $('.loader').show();
                $.ajax({
                    url: '{{ route('back.addSMSTemplate') }}',
                    method: 'post',
                    data: {
                        id: id,
                        name: name,
                        massage: massage,
                        _token: _token
                    },
                    success: function (result) {
                        $('.loader').hide();
                        if(result == 'true'){
                            Toast.fire({
                                icon: 'success',
                                title: 'Template updated successfully.'
                            });
                        }else{
                            Toast.fire({
                                icon: 'error',
                                title: 'Something wrong.'
                            });
                        }
                    }
                });
            }else{
                Toast.fire({
                    icon: 'error',
                    title: 'Fields must not be empty.'
                });
            }
        });

        // App Status Change
        $(document).on('change', '.appStatus', function () {
            let group = $(this).data('group');
            let name = $(this).data('name');
            $('.loader').show();

            $.ajax({
                url: '{{ route('back.changeApp') }}',
                method: 'get',
                data: {
                    group: group,
                    name: name
                },
                success: function (result) {
                    $('.loader').hide();
                    if(result == 'true'){
                        Toast.fire({
                            icon: 'success',
                            title: 'Status change successfully.'
                        });
                    }else{
                        Toast.fire({
                            icon: 'error',
                            title: 'Something wrong.'
                        });
                    }
                }
            });
        });
    </script>
@endsection
