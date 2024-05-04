from .models import Disease

def fetch_recommendations(result):
    try:
        # Query the Disease model to find a disease with the provided name
        disease = Disease.objects.get(name=result)

        # Return recommendations for the found disease
        return {
            'summary': disease.summary,
            'how_to_identify': disease.how_to_identify,
            'how_to_prevent': disease.how_to_prevent,
            'how_to_treat': disease.how_to_treat
        }
    except Disease.DoesNotExist:
        # If the disease is not found, return None
        return None
