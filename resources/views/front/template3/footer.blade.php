<footer class="bg-[#007789] pt-2 md:pt-12">
    <div class="{{ $container }} py-4 items-center font-light text-white text-sm lg:text-md mt-5">
        <div class="hidden md:grid grid grid-cols-2 md:grid-cols-5 gap-2 justify-center">
            @foreach ($widgets as $widget)
                <div class="justify-left">
                    @if($widget->is_show_title)
                        <h2 class="py-1 font-semibold text-md lg:text-lg">{{$widget->title}}</h2>
                    @endif
                    @if($widget->type == 'Menu' && $widget->Menu)
                        <ul class="pt-2 font-light justify-between">
                            @foreach ($widget->Menu->SingleMenuItems as $item)
                                <li class="py-1">
                                    <a class="hover:text-menu-color-1 text-md" href="{{$item->menu_info['url']}}">{{$item->menu_info['text']}}</a>
                                </li>
                            @endforeach
                        </ul>
                    @elseif($widget->type == 'Social')
                        <div class="font-light text-white mt-4">
                            <img class="max-w-full object-contain object-left w-full" src="/paym.png" alt="haqdaq.com">
                            <div class="font-medium text-left mt-4">Follow Us</div>
                            <div class="flex flex-wrap justify-start gap-1 mt-1">
                                @foreach ($socials as $social)
                                    @if($social->name == 'facebook')
                                    <a href="{{$social->value}}" target="_blank" class="bg-blue-500 p-2 font-semibold text-white inline-flex items-center space-x-2 rounded-xl">
                                        <svg class="w-5 h-5 md:w-5 h:h-5 fill-current" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z" />
                                        </svg>
                                    </a>
                                    @elseif($social->name == 'instagram')
                                    <a href="{{$social->value}}" target="_blank" class="bg-red-500 p-2 font-semibold text-white inline-flex items-center space-x-2 rounded-xl">
                                        <svg xmlns="http://www.w3.org/2000/svg"
                                                class="w-5 h-5 md:w-5 h:h-5"
                                                fill="currentColor"
                                                viewBox="0 0 24 24">
                                            <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z" />
                                        </svg>
                                    </a>
                                    @elseif($social->name == 'twitter')
                                    <a href="{{$social->value}}" target="_blank" class="bg-blue-400 p-2 font-semibold text-white inline-flex items-center space-x-2 rounded-xl">
                                        <svg class="w-5 h-5 md:w-5 h:h-5 fill-current" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path d="M23.953 4.57a10 10 0 01-2.825.775 4.958 4.958 0 002.163-2.723c-.951.555-2.005.959-3.127 1.184a4.92 4.92 0 00-8.384 4.482C7.69 8.095 4.067 6.13 1.64 3.162a4.822 4.822 0 00-.666 2.475c0 1.71.87 3.213 2.188 4.096a4.904 4.904 0 01-2.228-.616v.06a4.923 4.923 0 003.946 4.827 4.996 4.996 0 01-2.212.085 4.936 4.936 0 004.604 3.417 9.867 9.867 0 01-6.102 2.105c-.39 0-.779-.023-1.17-.067a13.995 13.995 0 007.557 2.209c9.053 0 13.998-7.496 13.998-13.985 0-.21 0-.42-.015-.63A9.935 9.935 0 0024 4.59z" />
                                        </svg>
                                    </a>
                                    @elseif($social->name == 'linkedin')
                                    <a href="{{$social->value}}" target="_blank" class="bg-blue-600 p-2 font-semibold text-white inline-flex items-center space-x-2 rounded-xl">
                                        <svg class="w-5 h-5 md:w-5 h:h-5 fill-current" role="img" viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg">
                                            <g><path d="M218.123122,218.127392 L180.191928,218.127392 L180.191928,158.724263 C180.191928,144.559023 179.939053,126.323993 160.463756,126.323993 C140.707926,126.323993 137.685284,141.757585 137.685284,157.692986 L137.685284,218.123441 L99.7540894,218.123441 L99.7540894,95.9665207 L136.168036,95.9665207 L136.168036,112.660562 L136.677736,112.660562 C144.102746,99.9650027 157.908637,92.3824528 172.605689,92.9280076 C211.050535,92.9280076 218.138927,118.216023 218.138927,151.114151 L218.123122,218.127392 Z M56.9550587,79.2685282 C44.7981969,79.2707099 34.9413443,69.4171797 34.9391618,57.260052 C34.93698,45.1029244 44.7902948,35.2458562 56.9471566,35.2436736 C69.1040185,35.2414916 78.9608713,45.0950217 78.963054,57.2521493 C78.9641017,63.090208 76.6459976,68.6895714 72.5186979,72.8184433 C68.3913982,76.9473153 62.7929898,79.26748 56.9550587,79.2685282 M75.9206558,218.127392 L37.94995,218.127392 L37.94995,95.9665207 L75.9206558,95.9665207 L75.9206558,218.127392 Z M237.033403,0.0182577091 L18.8895249,0.0182577091 C8.57959469,-0.0980923971 0.124827038,8.16056231 -0.001,18.4706066 L-0.001,237.524091 C0.120519052,247.839103 8.57460631,256.105934 18.8895249,255.9977 L237.033403,255.9977 C247.368728,256.125818 255.855922,247.859464 255.999,237.524091 L255.999,18.4548016 C255.851624,8.12438979 247.363742,-0.133792868 237.033403,0.000790807055"></path></g>
                                        </svg>
                                    </a>
                                    @elseif($social->name == 'youtube')
                                    <a href="{{$social->value}}" target="_blank" class="bg-red-600 p-2 font-semibold text-white inline-flex items-center space-x-2 rounded-xl">
                                        <svg class="w-5 h-5 md:w-5 h:h-5 fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
                                            <path d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.007 2.007 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.007 2.007 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31.4 31.4 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.007 2.007 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A99.788 99.788 0 0 1 7.858 2h.193zM6.4 5.209v4.818l4.157-2.408L6.4 5.209z" />
                                        </svg>
                                    </a>
                                    @endif
                                @endforeach
                            </div>
                        </div>
                    @else
                        <div>{!! $widget->text !!}</div>
                    @endif
                </div>
            @endforeach
        </div>
        <div id="accordion-flush" class="md:hidden" data-accordion="collapse" data-active-classes="text-white" data-inactive-classes="text-white">
            @foreach ($widgets as $key2=>$widget)
                <h2 id="accordion-color-heading-{{$key2}}">
                    <button type="button" class="flex items-center justify-between w-full py-3 font-medium rtl:text-right text-white border-b border-gray-200 gap-3"
                            data-accordion-target="#accordion-color-body-{{ $key2 }}" aria-expanded="true"
                            aria-controls="accordion-color-body-{{ $key2 }}">
                        <span>{{ $widget->title }}</span>
                        <svg data-accordion-icon class="w-3 h-3 rotate-180 shrink-0" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5 5 1 1 5"/>
                        </svg>
                    </button>
                </h2>
                <div id="accordion-color-body-{{ $key2 }}" class="hidden" aria-labelledby="accordion-color-heading-{{ $key2 }}">
                    @if($widget->type == 'Menu' && $widget->Menu)
                        <ul class="pt-2 font-light text-white md:justify-between">
                            @foreach ($widget->Menu->SingleMenuItems as $item)
                                <li class="py-1">
                                    <a class="hover:text-menu-color-1" href="{{$item->menu_info['url']}}">{{$item->menu_info['text']}}</a>
                                </li>
                            @endforeach
                        </ul>
                    @elseif($widget->type == 'Social')
                        <div class="font-light text-white mt-4">
                            <img class="max-w-full object-contain object-left w-full" src="/paym.png" alt="haqdaq.com">
                            <div class="font-medium text-left mt-4">Follow Us</div>
                            <div class="flex flex-wrap justify-start gap-1 mt-1">
                                @foreach ($socials as $social)
                                    @if($social->name == 'facebook')
                                        <a href="{{$social->value}}" target="_blank" class="bg-blue-500 p-2 font-semibold text-white inline-flex items-center space-x-2 rounded-xl">
                                            <svg class="w-5 h-5 md:w-5 h:h-5 fill-current" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z" />
                                            </svg>
                                        </a>
                                    @elseif($social->name == 'instagram')
                                        <a href="{{$social->value}}" target="_blank" class="bg-red-500 p-2 font-semibold text-white inline-flex items-center space-x-2 rounded-xl">
                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                 class="w-5 h-5 md:w-5 h:h-5"
                                                 fill="currentColor"
                                                 viewBox="0 0 24 24">
                                                <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z" />
                                            </svg>
                                        </a>
                                    @elseif($social->name == 'twitter')
                                        <a href="{{$social->value}}" target="_blank" class="bg-blue-400 p-2 font-semibold text-white inline-flex items-center space-x-2 rounded-xl">
                                            <svg class="w-5 h-5 md:w-5 h:h-5 fill-current" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M23.953 4.57a10 10 0 01-2.825.775 4.958 4.958 0 002.163-2.723c-.951.555-2.005.959-3.127 1.184a4.92 4.92 0 00-8.384 4.482C7.69 8.095 4.067 6.13 1.64 3.162a4.822 4.822 0 00-.666 2.475c0 1.71.87 3.213 2.188 4.096a4.904 4.904 0 01-2.228-.616v.06a4.923 4.923 0 003.946 4.827 4.996 4.996 0 01-2.212.085 4.936 4.936 0 004.604 3.417 9.867 9.867 0 01-6.102 2.105c-.39 0-.779-.023-1.17-.067a13.995 13.995 0 007.557 2.209c9.053 0 13.998-7.496 13.998-13.985 0-.21 0-.42-.015-.63A9.935 9.935 0 0024 4.59z" />
                                            </svg>
                                        </a>
                                    @elseif($social->name == 'linkedin')
                                        <a href="{{$social->value}}" target="_blank" class="bg-blue-600 p-2 font-semibold text-white inline-flex items-center space-x-2 rounded-xl">
                                            <svg class="w-5 h-5 md:w-5 h:h-5 fill-current" role="img" viewBox="0 0 256 256" xmlns="http://www.w3.org/2000/svg">
                                                <g><path d="M218.123122,218.127392 L180.191928,218.127392 L180.191928,158.724263 C180.191928,144.559023 179.939053,126.323993 160.463756,126.323993 C140.707926,126.323993 137.685284,141.757585 137.685284,157.692986 L137.685284,218.123441 L99.7540894,218.123441 L99.7540894,95.9665207 L136.168036,95.9665207 L136.168036,112.660562 L136.677736,112.660562 C144.102746,99.9650027 157.908637,92.3824528 172.605689,92.9280076 C211.050535,92.9280076 218.138927,118.216023 218.138927,151.114151 L218.123122,218.127392 Z M56.9550587,79.2685282 C44.7981969,79.2707099 34.9413443,69.4171797 34.9391618,57.260052 C34.93698,45.1029244 44.7902948,35.2458562 56.9471566,35.2436736 C69.1040185,35.2414916 78.9608713,45.0950217 78.963054,57.2521493 C78.9641017,63.090208 76.6459976,68.6895714 72.5186979,72.8184433 C68.3913982,76.9473153 62.7929898,79.26748 56.9550587,79.2685282 M75.9206558,218.127392 L37.94995,218.127392 L37.94995,95.9665207 L75.9206558,95.9665207 L75.9206558,218.127392 Z M237.033403,0.0182577091 L18.8895249,0.0182577091 C8.57959469,-0.0980923971 0.124827038,8.16056231 -0.001,18.4706066 L-0.001,237.524091 C0.120519052,247.839103 8.57460631,256.105934 18.8895249,255.9977 L237.033403,255.9977 C247.368728,256.125818 255.855922,247.859464 255.999,237.524091 L255.999,18.4548016 C255.851624,8.12438979 247.363742,-0.133792868 237.033403,0.000790807055"></path></g>
                                            </svg>
                                        </a>
                                    @elseif($social->name == 'youtube')
                                        <a href="{{$social->value}}" target="_blank" class="bg-red-600 p-2 font-semibold text-white inline-flex items-center space-x-2 rounded-xl">
                                            <svg class="w-5 h-5 md:w-5 h:h-5 fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
                                                <path d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.007 2.007 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.007 2.007 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31.4 31.4 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.007 2.007 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A99.788 99.788 0 0 1 7.858 2h.193zM6.4 5.209v4.818l4.157-2.408L6.4 5.209z" />
                                            </svg>
                                        </a>
                                    @endif
                                @endforeach
                            </div>
                        </div>
                    @else
                        <div class="text-white">{!! $widget->text !!}</div>
                    @endif
                </div>
            @endforeach
        </div>
        <div class="font-light mt-4">
            {{--<div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                <div class="font-light justify-start items-start ml-md-n4 mt-1 col-span-3 bg-[#989898]">
                    <img class="object-cover" alt="" src="/pay.png"/>
                </div>
                <div class="items-center justify-end space-y-4 sm:flex sm:space-y-0 sm:space-x-4 rtl:space-x-reverse">
                    <a href="{{ $settings_g['appstore'] ?? '#' }}" class="w-full sm:w-auto bg-gray-200 hover:bg-gray-300 focus:ring-4 focus:outline-none focus:ring-gray-300 text-black rounded-lg inline-flex items-center justify-center px-4 py-2.5 ">
                        <svg class="me-3 w-7 h-7" aria-hidden="true" focusable="false" data-prefix="fab" data-icon="apple" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
                            <path fill="currentColor" d="M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5q0 39.3 14.4 81.2c12.8 36.7 59 126.7 107.2 125.2 25.2-.6 43-17.9 75.8-17.9 31.8 0 48.3 17.9 76.4 17.9 48.6-.7 90.4-82.5 102.6-119.3-65.2-30.7-61.7-90-61.7-91.9zm-56.6-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z"></path></svg>
                        <div class="text-left rtl:text-right">
                            <!--              <div class="mb-1 text-xs">Download on the</div>-->
                            <div class="-mt-1 font-sans text-xs font-semibold">App Store</div>
                        </div>
                    </a>
                    <a href="{{ $settings_g['playstore'] ?? '#' }}" class="w-full sm:w-auto bg-gray-200 hover:bg-gray-300 focus:ring-4 focus:outline-none focus:ring-gray-300 text-black rounded-lg inline-flex items-center justify-center px-4 py-2.5">
                        <svg class="me-3 w-7 h-7" aria-hidden="true" focusable="false" data-prefix="fab" data-icon="google-play" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M325.3 234.3L104.6 13l280.8 161.2-60.1 60.1zM47 0C34 6.8 25.3 19.2 25.3 35.3v441.3c0 16.1 8.7 28.5 21.7 35.3l256.6-256L47 0zm425.2 225.6l-58.9-34.1-65.7 64.5 65.7 64.5 60.1-34.1c18-14.3 18-46.5-1.2-60.8zM104.6 499l280.8-161.2-60.1-60.1L104.6 499z"></path></svg>
                        <div class="text-left rtl:text-right">
                            <!--              <div class="mb-1 text-xs">Get in on</div>-->
                            <div class="-mt-1 font-sans text-xs font-semibold">Google Play</div>
                        </div>
                    </a>
                </div>
            </div>--}}
            <hr class="my-2">
            <div class="grid grid-cols-1 md:grid-cols-5">
                <div class="font-light md:col-span-5">{!! $settings_g['copyright'] ?? '' !!} | Developed by <a class="underline" href="https://eomsbd.com">Best E-commerce Website Developer</a></div>
                {{--<div class="font-light md:text-center md:col-span-2">
                    <div class="">
                        <a href="#" class="hover:text-menu-color-1">Item 1</a>
                        --}}{{--<span v-if="(key+1) != footer_menus.length"> | </span>--}}{{--
                    </div>
                </div>--}}
            </div>
        </div>
    </div>
</footer>