from django.http import HttpResponse, JsonResponse
from django.shortcuts import render


def beds(request):
    beds = [
        {
            "id": 0,
            "lat": 52.35625972732908,
            "lon": 8.280542260879246,
        },
        {
            "id": 1,
            "lat": 52.35647385473947,
            "lon": 8.280273487634898,
        },
        {
            "id": 2,
            "lat": 52.35638394587384,
            "lon": 8.280439847839847,
        },
        {
            "id": 3,
            "lat": 52.35628234982387,
            "lon": 8.280345839873482,
        },
    ]
    return JsonResponse(beds, safe=False)


def bedsId(request, id):
    beds = [
        {
            "id": 0,
            "lat": 52.35625972732908,
            "lon": 8.280542260879246,
        },
        {
            "id": 1,
            "lat": 52.35647385473947,
            "lon": 8.280273487634898,
        },
        {
            "id": 2,
            "lat": 52.35638394587384,
            "lon": 8.280439847839847,
        },
        {
            "id": 3,
            "lat": 52.35628234982387,
            "lon": 8.280345839873482,
        },
    ]
    return JsonResponse(beds[id])
