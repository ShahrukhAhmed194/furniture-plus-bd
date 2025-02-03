<div class="hidden md:flex flex items-center flex-wrap grid-cols-2 justify-center space-x-2 py-0 gap-2 relative z-[99999]">
    @foreach ($main_menu->SingleMenuItems as $key=>$menu_item)
        @if(count($menu_item->Items))
            <!-- categories start -->
            <div class=" group">
                <div class="flex md:flex-col items-center gap-2 opacity-70 z-50 cursor-pointer">
                    @if($menu_item->menu_info['icon'])
                        <img src="{{ asset('/uploads/'.$menu_item->menu_info['icon']) }}" alt="" class="w-8 h-8 hidden md:block">
                    @else
                        <img src="{{ asset('/img/menu-item.png') }}" alt="" class="w-8 h-8 hidden md:block">
                    @endif
                    <div class="flex items-center justify-center">
                        <span>{{$menu_item->menu_info['text']}}</span>
                        <svg class="w-2.5 h-2.5 ms-3 text-gray-900" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
                        </svg>
                    </div>
                </div>
                <div class="absolute left-1/2 transform -translate-x-1/2 border hidden group-hover:block hover:block bg-white p-4 rounded shadow-lg w-full z-[9999999]">
                    {{--<div class="relative">
                        @foreach ($menu_item->Items as $menu_item)
                            <div class="flex items-center justify-center flex-col gap-2">
                                <h5>{{$menu_item->menu_info['text']}}</h5>
                                <div class="max-w-[200px] w-full h-[2px] bg-black opacity-70"></div>
                            </div>
                        @endforeach
                        <ul class="grid grid-cols-2 md:grid-cols-5 mt-5 gap-5 text-center">
                            @foreach ($menu_item->Items as $menu_item)
                                <li class="cursor-pointer hover:text-green-700">
                                    <a href="{{$menu_item->menu_info['url']}}">{{$menu_item->menu_info['text']}}</a>
                                </li>
                            @endforeach
                        </ul>
                    </div>--}}

                    <div class="mb-4 border-b border-gray-200">
                        <ul class="flex flex-wrap -mb-px text-sm font-medium justify-center text-center" id="default-tab" data-tabs-toggle="#default-tab-content" role="tablist">
                            @php
                                $mm = $menu_item->Items;
                            @endphp
                            @foreach ($menu_item->Items as $key2=>$menu_item)
                                @if($menu_item->Items && count($menu_item->Items))
                                    <li class="me-2" role="presentation">
                                        <button class="inline-block p-4 border-b-2 rounded-t-lg" id="profile{{$key}}{{$key2}}-tab" data-tabs-target="#profile{{$key}}{{$key2}}" type="button" role="tab" aria-controls="profile{{$key}}{{$key2}}" aria-selected="false">{{$menu_item->menu_info['text']}}</button>
                                    </li>
                                @else
                                    <li class="me-2" role="presentation">
                                        <a href="{{$menu_item->menu_info['url']}}" class="inline-block p-4 border-b-2 rounded-t-lg" id="profile{{$key}}{{$key2}}-tab" data-tabs-target="#profile{{$key}}{{$key2}}" aria-controls="profile{{$key}}{{$key2}}" aria-selected="false">{{$menu_item->menu_info['text']}}</a>
                                    </li>
                                @endif
                            @endforeach
                        </ul>
                    </div>
                    <div id="default-tab-content">
                        @foreach ($mm as $key2=>$menu_item)
                            <div class="hidden p-4 rounded-lg bg-gray-50" id="profile{{$key}}{{$key2}}" role="tabpanel" aria-labelledby="profile{{$key}}{{$key2}}-tab">
                                <ul class="grid grid-cols-2 md:grid-cols-5 mt-5 gap-5 text-center">
                                    @foreach ($menu_item->Items as $menu_item)
                                        <li class="cursor-pointer text-black hover:text-green-700">
                                            <a href="{{$menu_item->menu_info['url']}}">{{$menu_item->menu_info['text']}}</a>
                                        </li>
                                    @endforeach
                                </ul>
                            </div>
                        @endforeach
                    </div>

                </div>
            </div>
        @else
            <a href="{{$menu_item->menu_info['url']}}" class="flex md:flex-col items-center gap-2 opacity-70 z-50 cursor-pointer">
                @if($menu_item->menu_info['icon'])
                    <img src="{{'/uploads/'.$menu_item->menu_info['icon']}}" alt="" class="w-8 h-8 hidden md:block">
                @else
                    <img src="{{ asset('/img/menu-item.png') }}" alt="" class="w-8 h-8 hidden md:block">
                @endif

                <div class="flex items-center justify-center">
                    <span>{{$menu_item->menu_info['text']}}</span>
                </div>
            </a>
        @endif
    @endforeach
</div>

