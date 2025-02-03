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
                <div class="border border-gray-300 rounded-lg p-6 shadow-[0_2px_22px_-4px_rgba(93,96,127,0.2)] max-md:mx-auto">
                    <form class="space-y-4" method="POST" action="{{ route('forget.passSet',[$phone_number,$uid]) }}">
                        @csrf
                        @method('POST')
                        <div class="mb-8">
                            <h3 class="text-gray-800 text-3xl font-extrabold">Set new password</h3>
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
                        <div>
                            <label class="text-gray-800 text-sm my-2 block">Password*</label>
                            <div class="relative flex items-center flex-col">
                                <input type="password" required class="password w-full text-sm text-gray-800 border  px-4 py-3 rounded-lg outline-blue-600 @error('password') border-red-500 @enderror" placeholder="Enter password"  name="password"/>
                                <svg xmlns="http://www.w3.org/2000/svg" fill="#bbb" stroke="#bbb" class="w-[18px] h-[18px] absolute right-4 top-3 cursor-pointer showpass" viewBox="0 0 128 128">
                                    <path d="M64 104C22.127 104 1.367 67.496.504 65.943a4 4 0 0 1 0-3.887C1.367 60.504 22.127 24 64 24s62.633 36.504 63.496 38.057a4 4 0 0 1 0 3.887C126.633 67.496 105.873 104 64 104zM8.707 63.994C13.465 71.205 32.146 96 64 96c31.955 0 50.553-24.775 55.293-31.994C114.535 56.795 95.854 32 64 32 32.045 32 13.447 56.775 8.707 63.994zM64 88c-13.234 0-24-10.766-24-24s10.766-24 24-24 24 10.766 24 24-10.766 24-24 24zm0-40c-8.822 0-16 7.178-16 16s7.178 16 16 16 16-7.178 16-16-7.178-16-16-16z" data-original="#000000"></path>
                                </svg>
                            </div>
                        </div>

                        <div>
                            <label class="text-gray-800 text-sm my-2 block">Confirm Password*</label>
                            <div class="relative flex items-center flex-col">
                                <input type="password" required class="password w-full text-sm text-gray-800 border border-gray-300 px-4 py-3 rounded-lg outline-blue-600 bg-slate-100" placeholder="Enter password"  name="password_confirmation"/>
                                <svg xmlns="http://www.w3.org/2000/svg" fill="#bbb" stroke="#bbb" class="w-[18px] h-[18px] absolute right-4 top-3 cursor-pointer showpass" viewBox="0 0 128 128">
                                    <path d="M64 104C22.127 104 1.367 67.496.504 65.943a4 4 0 0 1 0-3.887C1.367 60.504 22.127 24 64 24s62.633 36.504 63.496 38.057a4 4 0 0 1 0 3.887C126.633 67.496 105.873 104 64 104zM8.707 63.994C13.465 71.205 32.146 96 64 96c31.955 0 50.553-24.775 55.293-31.994C114.535 56.795 95.854 32 64 32 32.045 32 13.447 56.775 8.707 63.994zM64 88c-13.234 0-24-10.766-24-24s10.766-24 24-24 24 10.766 24 24-10.766 24-24 24zm0-40c-8.822 0-16 7.178-16 16s7.178 16 16 16 16-7.178 16-16-7.178-16-16-16z" data-original="#000000"></path>
                                </svg>
                            </div>
                        </div>
                        <div class="!mt-8">
                            <button type="submit" class="w-full shadow-xl py-3 px-4 text-sm tracking-wide rounded-lg text-white bg-blue-600 hover:bg-blue-700 focus:outline-none">
                                Submit
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
