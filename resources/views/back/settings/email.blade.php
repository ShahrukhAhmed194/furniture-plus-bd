@extends('back.layouts.master')
@section('title', "Email")

@section('master')

<div class="container-fluid">

	<!-- Page Heading -->
    <div class="card mb-4">
        <div class="card-body">
            <div class="d-sm-flex align-items-center justify-content-between">
                <h3 class=" mb-0 bc-title"> <b>{{ __('Email') }}</b> </h3>
                </div>
        </div>
    </div>

	<!-- Form -->
	<div class="row">

		<div class="col-xl-12 col-lg-12 col-md-12">

			<div class="card o-hidden border-0 shadow-lg">
				<div class="card-body ">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-12">
							<div class="p-5">
								<form class="admin-form" action="{{ route('back.email.update') }}" method="POST"
									enctype="multipart/form-data">
                                    @csrf
									@include('alerts.alerts')
                                    <div class="container pl-0 pr-0 ml-0 mr-0 w-100 mw-100">
                                        <div id="tabs">
                                            <ul class="nav nav-pills nav-secondary nav-justified mb-3" role="tablist">
                                            <li class="nav-item">
                                              <a class="nav-link active" data-toggle="pill" href="#conf">{{ __('Configuration') }}</a>
                                            </li>
                                            <li class="nav-item">
                                              <a class="nav-link" data-toggle="pill" href="#template">{{ __('Templates') }}</a>
                                            </li>

                                          </ul>
                                            <!-- Tab panes -->
                                            <div class="tab-content">
                                          <div id="conf" class="container tab-pane active"><br>
                                            <div class="row justify-content-center">
                                                <div class="col-lg-8">
                                                    <form action="{{ route('back.setting.update') }}" method="POST" enctype="multipart/form-data">
                                                        @csrf

                                                        <div class="form-group">
                                                            <label class="switch-primary">
                                                              <input type="checkbox" class="switch switch-bootstrap status radio-check" name="smtp_check" value="1" {{ \App\Traits\SMSTrait::web('email', 'smtp_check') == 1 ? 'checked' : '' }}>
                                                              <span class="switch-body"></span>
                                                              <span class="switch-text">{{ __('SMTP Service') }}</span>
                                                            </label>
                                                        </div>

                                                        <div class="radio-show {{ \App\Traits\SMSTrait::web('email', 'smtp_check') == 0 ? 'd-none' : '' }}">

                                                            <div class="form-group ">
                                                                <label for="email_host">{{ __('SMTP Host') }}</label>
                                                                <input type="text" class="form-control " id="email_host" name="email_host" placeholder="{{ __('Enter SMTP Host') }}" value="{{ \App\Traits\SMSTrait::web('email', 'email_host') }}">
                                                            </div>

                                                            <div class="form-group ">
                                                                <label for="email_port">{{ __('SMTP Port') }}</label>
                                                                <input type="text" class="form-control " id="email_port" name="email_port" placeholder="{{ __('Enter SMTP Port') }}" value="{{ \App\Traits\SMSTrait::web('email', 'email_port') }}">
                                                            </div>

                                                            <div class="form-group ">
                                                                <label for="email_encryption">{{ __('SMTP Encryption') }}</label>
                                                                <input type="text" class="form-control " id="email_encryption" name="email_encryption" placeholder="{{ __('Enter SMTP Encryption') }}" value="{{\App\Traits\SMSTrait::web('email', 'email_encryption') }}">
                                                            </div>

                                                            <div class="form-group ">
                                                                <label for="email_user">{{ __('SMTP Username') }}</label>
                                                                <input type="text" class="form-control " id="email_user" name="email_user" placeholder="{{ __('Enter SMTP Username') }}" value="{{\App\Traits\SMSTrait::web('email', 'email_user') }}">
                                                            </div>

                                                            <div class="form-group ">
                                                                <label for="email_pass">{{ __('SMTP Password') }}</label>
                                                                <input type="text" class="form-control " id="email_pass" name="email_pass" placeholder="{{ __('Enter SMTP Password') }}" value="{{\App\Traits\SMSTrait::web('email', 'email_pass') }}">
                                                            </div>

                                                        </div>

                                                        <div class="form-group ">
                                                            <label for="email_from">{{ __('Email From') }}</label>
                                                            <input type="text" class="form-control " id="email_from" name="email_from" placeholder="{{ __('Enter Email From') }}" value="{{\App\Traits\SMSTrait::web('email', 'email_from') }}">
                                                        </div>

                                                        <div class="form-group ">
                                                            <label for="email_from_name">{{ __('Email From Name') }}</label>
                                                            <input type="text" class="form-control " id="email_from_name" name="email_from_name" placeholder="{{ __('Enter Email From Name') }}" value="{{\App\Traits\SMSTrait::web('email', 'email_from_name') }}">
                                                        </div>

                                                        <div class="form-group ">
                                                            <label for="contact_email">{{ __('Contact Email') }}</label>
                                                            <input type="text" class="form-control " id="contact_email" name="contact_email" placeholder="{{ __('Enter Contact Email') }}" value="{{\App\Traits\SMSTrait::web('email', 'contact_email') }}">
                                                        </div>
                                                        <div>

                                                                <div class="form-group d-flex justify-content-center">
                                                                    <button type="submit" class="btn btn-secondary btn-block w-100">{{ __('Submit') }}</button>
                                                                </div>

                                                            </div>
                                                    </form>
                                                </div>
                                            </div>
                                          </div>
                                          <div id="template" class="container tab-pane"><br>
                                            <!-- DataTales -->
                                            <div class="card shadow mb-4">
                                                <div class="card-body">
                                                    <div class="gd-responsive-table">
                                                        <table class="table table-bordered table-striped" id="admin-table" width="100%" cellspacing="0">
                                                            <thead>
                                                                <tr>
                                                                    <th width="20%">{{ __('Type') }}</th>
                                                                    <th width="20%">{{ __('Subject') }}</th>
                                                                    <th width="15%">{{ __('Actions') }}</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                @foreach($datas as $data)
                                                                    <tr>
                                                                        <td>
                                                                            {{ $data->type }}
                                                                        </td>
                                                                        <td>
                                                                            {{ $data->subject }}
                                                                        </td>
                                                                        <td>
                                                                            <div class="action-list">
                                                                                <a class="btn btn-secondary btn-sm"
                                                                                    href="{{ route('back.template.edit',$data->id) }}">
                                                                                    <i class="fas fa-edit"></i> {{ __('Edit') }}
                                                                                </a>
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
                                        </div>
                                        </div>
                                    </div>
                                </form>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>

</div>

@endsection
@section('footer')

@endsection
