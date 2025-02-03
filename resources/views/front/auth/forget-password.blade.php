@php
    $template = 0;
    if(isset($settings_g['template'])) $template = $settings_g['template'];
@endphp

@extends('front.layouts.master')

@section('head')
    @include('meta::manager', [
        'title' => 'Forget password - ' . ($settings_g['title'] ?? ''),
    ])
@endsection

@section('master')
    <div>
        <div class=" flex fle-col items-center justify-center py-6 px-4">
            <div class="grid md:grid-cols-2 items-center gap-4 max-w-6xl w-full">
                <div class="lg:h-[400px] md:h-[300px] max-md:mt-8 hidden md:block">
                    <img src="{{ asset('/img/login-image.webp') }}" class="w-full h-full max-md:w-4/5 mx-auto block object-cover" alt="Dining Experience" />
                </div>
                @if(request()->query('phone_number'))
                    <form id="resent-otp-form" action="{{route('password.forget')}}" method="POST" style="display: none;">
                        @csrf
                        @method('POST')
                        <input type="hidden" name="phone_number" value="{{request()->query('phone_number')}}">
                    </form>
                @endif
                <div class="border border-gray-300 rounded-lg p-6 shadow-[0_2px_22px_-4px_rgba(93,96,127,0.2)] max-md:mx-auto">
                    <form class="space-y-4" method="POST" action="{{ request()->query('phone_number') ? route('forget.verify.otp') : route('password.forget') }}">
                        @csrf
                        @method('POST')
                        <div class="mb-8">
                            <h3 class="text-gray-800 text-3xl font-extrabold">Forget password</h3>
                        </div>
                        @if(isset($errors))
                            @include('extra.error-validation')
                        @endif
                        @if(session('success'))
                            @include('extra.success')
                        @endif
                        @if(session('error'))
                            @include('extra.error')
                        @endif
                        @if(request()->query('phone_number'))
                            <div>
                                <label class="text-gray-800 text-sm mb-2 block">Phone Number</label>
                                <div class="relative flex items-center">
                                    <input type="number" required class="w-full text-sm text-gray-800 border border-gray-300 px-4 py-3 rounded-lg outline-blue-600" readonly value="{{request()->query('phone_number')}}" name="phone_number" />
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="#bbb" stroke="#bbb" class="w-[18px] h-[18px] absolute right-4" viewBox="0 0 24 24">
                                        <circle cx="10" cy="7" r="6" data-original="#000000"></circle>
                                        <path d="M14 15H6a5 5 0 0 0-5 5 3 3 0 0 0 3 3h12a3 3 0 0 0 3-3 5 5 0 0 0-5-5zm8-4h-2.59l.3-.29a1 1 0 0 0-1.42-1.42l-2 2a1 1 0 0 0 0 1.42l2 2a1 1 0 0 0 1.42 0 1 1 0 0 0 0-1.42l-.3-.29H22a1 1 0 0 0 0-2z" data-original="#000000"></path>
                                    </svg>
                                </div>
                            </div>
                            <div class="flex flex-wrap items-center justify-end gap-4">
                                <div class="text-sm">
                                    <a href="#" onclick="event.preventDefault(); document.getElementById('resent-otp-form').submit();" class="text-blue-600 hover:underline font-semibold">
                                        Resent verification Code
                                    </a>
                                </div>
                            </div>
                            <div>
                                <label class="text-gray-800 text-sm mb-2 block">Verification Code</label>
                                <div class="relative flex items-center">
                                    <input name="otp" type="text" required class="password w-full text-sm text-gray-800 border border-gray-300 px-4 py-3 rounded-lg outline-blue-600" placeholder="Enter 6 digit verification code" />
                                </div>
                            </div>
                        @else
                            <div>
                                <label class="text-gray-800 text-sm mb-2 block">Phone Number</label>
                                <div class="relative flex items-center">
                                    <input type="number" required class="w-full text-sm text-gray-800 border border-gray-300 px-4 py-3 rounded-lg outline-blue-600" placeholder="Enter your phone number" value="{{old('phone_number')}}" name="phone_number" />
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="#bbb" stroke="#bbb" class="w-[18px] h-[18px] absolute right-4" viewBox="0 0 24 24">
                                        <circle cx="10" cy="7" r="6" data-original="#000000"></circle>
                                        <path d="M14 15H6a5 5 0 0 0-5 5 3 3 0 0 0 3 3h12a3 3 0 0 0 3-3 5 5 0 0 0-5-5zm8-4h-2.59l.3-.29a1 1 0 0 0-1.42-1.42l-2 2a1 1 0 0 0 0 1.42l2 2a1 1 0 0 0 1.42 0 1 1 0 0 0 0-1.42l-.3-.29H22a1 1 0 0 0 0-2z" data-original="#000000"></path>
                                    </svg>
                                </div>
                            </div>
                        @endif
                        {{--<div>
                                @captcha
                                <div class="relative flex items-center">
                                    <input name="captcha" type="text" id="captcha" required class="w-full text-sm text-gray-800 border border-gray-300 px-4 py-3 rounded-lg outline-blue-600" placeholder="Enter the captcha" />
                                </div>
                            </div> --}}
                        <div class="!mt-8">
                            <button type="submit" class="w-full shadow-xl py-3 px-4 text-sm tracking-wide rounded-lg text-white bg-blue-600 hover:bg-blue-700 focus:outline-none">
                                {{ request()->query('phone_number')?'Verify':'Sent Verification Code' }}
                            </button>
                        </div>
                        <p class="text-sm !mt-8 text-center text-gray-800">Don't have an account? <a href="{{route('register')}}" class="text-blue-600 font-semibold hover:underline ml-1 whitespace-nowrap">Register here</a></p>
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection
@section('footer')
<script>
    $('.showpass').click(function () {
        if ($('.password').attr('type') == 'text') {
            $('.password').attr('type', 'password');
        } else {
            $('.password').attr('type', 'text');
        }
    });
</script>

@endsection
