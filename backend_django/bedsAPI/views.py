from django.http import HttpResponse, JsonResponse
from django.shortcuts import render


def beds(request):
    beds = [
        {
            "id": 0,
        },
        {
            "id": 1,
        },
        {
            "id": 2,
        },
        {
            "id": 3,
        },
    ]
    return JsonResponse(beds, safe=False)


def bedsId(request, id):
    beds = [
        {
            "id": 0,
            "lat": 52.234,
            "lon": 8.3234,
        },
        {
            "id": 1,
            "lat": 34.343,
            "lon": 8.56,
        },
        {
            "id": 3,
            "lat": 55.234,
            "lon": 5.3234,
        },
        {
            "id": 4,
            "lat": 89.234,
            "lon": 10.3234,
        },
    ]
    return JsonResponse(beds[id])
