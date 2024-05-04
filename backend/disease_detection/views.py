from django.shortcuts import render

# Create your views here.
# disease_detection/views.py
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from .models import DiseaseDetector
import tensorflow as tf
import numpy as np
from PIL import Image
import base64
from .deeplearning import output_list






result=None
@csrf_exempt
def detect_disease(request):
    if request.method == 'POST':
        try:
            # Load model
            model = DiseaseDetector()

            # Get image data from request
            image_file = request.FILES['image']
            image = Image.open(image_file)

            # Preprocess image
            img = image.resize((224, 224))
            img = np.array(img)
            img = img / 255.0
            img = np.expand_dims(img, axis=0)

            # Perform inference
            prediction = model.predict(img)

            # Convert prediction to a serializable format (e.g., list)
            prediction_flatten = prediction.flatten()
            max_val_index = np.argmax(prediction_flatten)
            global result
            result = output_list[max_val_index]
            
            return JsonResponse({'prediction': result})
        except KeyError:
            return JsonResponse({'error': 'Image file is missing in the request'}, status=400)
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=500)
    else:
        return JsonResponse({'error': 'Only POST requests are allowed'}, status=405)




# views.py
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from .recommendation_algorithm import fetch_recommendations
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt





@csrf_exempt
def recommend_info(request):
    if request.method == 'GET':
        # Assuming the result is passed in the request
        data = request.GET
        prediction_result = data.get(result)  # Assuming 'result' is the key for the prediction result

        recommendations = fetch_recommendations(prediction_result)
        if recommendations:
            return JsonResponse(recommendations)
        else:
            return JsonResponse({'error': 'Recommendations not found for the prediction'}, status=404)
    else:
        return JsonResponse({'error': 'Only POST requests are allowed'}, status=405)
