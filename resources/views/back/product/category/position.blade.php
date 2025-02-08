@extends('back.layouts.master')
@section('title', 'Category Position')

@section('head')
    <style>
        .moveContent {
            list-style: none;
            padding: 0;
        }
        .moveContent tr {
            border: 1px solid #ddd;
            background: #f8f9fa;
            color: #333;
            padding: 10px;
            margin: 7px 0;
            border-radius: 5px;
            transition: .1s;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .moveContent tr:hover {
            cursor: move;
            background: #e9ecef;
        }
        .switch {
            position: relative;
            display: inline-block;
            width: 40px;
            height: 22px;
        }
        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: .4s;
            border-radius: 22px;
        }
        .slider:before {
            position: absolute;
            content: "";
            height: 16px;
            width: 16px;
            left: 4px;
            bottom: 3px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }
        input:checked + .slider {
            background-color: #28a745;
        }
        input:checked + .slider:before {
            transform: translateX(18px);
        }
    </style>
@endsection

@section('master')
<div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6">
        <form id="updatePositionForm" action="{{ route('back.categories.position.update') }}" method="post">
            @csrf
            <div class="card border-light mt-3 shadow">
                <div class="card-body">
                    <table class="table table-bordered table-hover" id="dataTable">
                        <thead class="table-dark">
                          <tr>
                            <th scope="col">Title</th>
                            <th scope="col">Status</th>
                            <th scope="col">Short Description</th>
                            <th scope="col">Action</th>
                          </tr>
                        </thead>
                        <tbody class="moveContent">
                            @foreach($categories as $category)
                            <tr data-id="{{$category->id}}">
                                <input type="hidden" name="position[]" value="{{$category->id}}">
                                <td>{{$category->title}}</td>
                                <td>
                                    <label class="switch">
                                        <input type="checkbox" class="status-toggle" data-id="{{$category->id}}" name="status_{{$category->id}}" {{$category->status == 1 ? 'checked' : 'unchecked'}}>
                                        <span class="slider"></span>
                                    </label>
                                </td>
                                <td>{{$category->short_description}}</td>
                                <td>
                                    <a class="btn btn-success btn-sm" href="{{route('back.categories.edit', $category->id)}}"><i class="fas fa-edit"></i></a>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                <div class="card-footer item-end">
                    <button type="submit" id="savePosition" class="btn btn-success">Update Position</button>
                </div>
            </div>
        </form>
    </div>
    <div class="col-md-3"></div>
</div>
@endsection

@section('footer')
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $(".moveContent").sortable({
                update: function(event, ui) {
                    let position = [];
                    $('.moveContent tr').each(function(index) {
                        position.push({ id: $(this).data('id'), position: index });
                    });
                }
            });
        });
    </script>
@endsection
