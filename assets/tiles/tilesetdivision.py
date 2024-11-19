from PIL import Image

def split_image(input_path, output_folder):
    # Charger l'image
    img = Image.open(input_path)
    
    # Assurer que l'image est au format RGBA (avec canal alpha)
    img = img.convert("RGBA")
    
    # Obtenir les dimensions de l'image
    width, height = img.size
    
    # Calculer le nombre de sections en largeur et en hauteur
    num_sections_width = width // 16
    num_sections_height = height // 16
    
    # Créer les sections de 16x16 pixels et les sauvegarder
    count = 0
    for row in range(num_sections_height):
        for col in range(num_sections_width):
            # Déterminer les coordonnées de début et de fin de la section
            left = col * 16
            upper = row * 16
            right = left + 16
            lower = upper + 16
            
            # Extraire la section de l'image
            section = img.crop((left, upper, right, lower))
            
            # Créer un nom de fichier unique
            filename = f"tile{count + 1}.png"
            
            # Sauvegarder la section dans le dossier de sortie
            section.save(f"{output_folder}/{filename}", "PNG")
            
            count += 1

if __name__ == "__main__":
    input_file = input(str("Entez le chemin d'accès du fichier > "))  # Chemin vers l'image d'entrée
    output_folder = input(str("Entrez le chemin de sortie du dossier > "))  # Dossier de sortie pour les sections
    
    split_image(input_file, output_folder)
    print("Image divisée avec succès!")
