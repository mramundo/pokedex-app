import json
from datetime import datetime

input_json_file = './json/pokedex-pokemon-com.json'
output_json_file = './json/pokedex.json'
debug = True


def log(method, message):
    date_format = '%d/%m/%Y, %H:%M:%S'

    if debug:
        print(
            f'[INFO][{datetime.now().strftime(date_format)}][{method}] {message}')


def read_json_file(file_name):
    json_file = open(f'{file_name}', "r")
    json_data = json.load(json_file)
    json_file.close()

    return json_data


def pounds_to_grams(pounds):
    return int(pounds * 453.6)


def inch_to_cm(inch):
    return round(inch * 2.54, 2)


def convert_json(json_file):
    log('convert_json', f'Starting converting {json_file}')
    log('convert_json', f'Getting pokemons')

    pokemons_formatted = []
    pokemons = read_json_file(json_file)['pokemon']

    for pokemon in pokemons:
        log('convert_json', f'Converting pokemon: {pokemon["name"]}')

        existing_index = next(
            (index for index, pokemon_formatted in enumerate(pokemons_formatted) if pokemon_formatted['code'] == pokemon['slug']), None)

        if existing_index is not None:
            pokemons_formatted.pop(existing_index)

        pokemons_formatted.append({
            "id": pokemon['id'],
            "number": pokemon['number'],
            "code": pokemon['slug'],
            "name": pokemon['name'],
            "description": 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Dignissim cras tincidunt lobortis feugiat vivamus.',
            "type": list(map(lambda item: item.lower(), pokemon['type'])),
            "weakness": list(map(lambda item: item.lower(), pokemon['weakness'])),
            "weight": pounds_to_grams(pokemon['weight']),
            "height": inch_to_cm(pokemon['height']),
            "sprite": f'sprites/{pokemon["slug"]}.png',
            "image": f'normal/{pokemon["slug"]}.png',
            "image_shiny": f'shiny/{pokemon["slug"]}.png'
        })

    converted_json = json.dumps({"pokemon": pokemons_formatted}, indent=4)

    log('convert_json', f'Finished converting {json_file}')

    return converted_json


pokemons_json = convert_json(input_json_file)

with open(output_json_file, 'w') as json_file:
    json_file.write(pokemons_json)
