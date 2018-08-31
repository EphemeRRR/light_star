# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "cleaning db"
SuperCategory.destroy_all
SubCategory.destroy_all
Video.destroy_all
VideoCategory.destroy_all
puts "cleaning completed"

puts "creating super categories :"
cat1 = SuperCategory.create!(name: "Physiques, Chimies & Technologies")
cat2 = SuperCategory.create!(name: "Terre & Univers")
cat3 = SuperCategory.create!(name: "Les Vivants")
cat4 = SuperCategory.create!(name: "Sports & Santés")
cat5 = SuperCategory.create!(name: "Cultures & Sociétés")
cat6 = SuperCategory.create!(name: "Langues & Languages")
cat7 = SuperCategory.create!(name: "Mathématiques")
cat8 = SuperCategory.create!(name: "Histoires")
cat9 = SuperCategory.create!(name: "Techniques")
puts "adding #{SuperCategory.all.count} super categories in db."

puts "creating sub categories :"
cat11 = SubCategory.new(name: "Technologies")
cat11.super_category = cat1
cat11.save
cat12 = SubCategory.new(name: "Matière & Matériaux")
cat12.super_category = cat1
cat12.save
cat13 = SubCategory.new(name: "Interactions & Mécaniques")
cat13.super_category = cat1
cat13.save
cat21 = SubCategory.new(name: "Astronomies & Cosmologies")
cat21.super_category = cat2
cat21.save
cat22 = SubCategory.new(name: "Terre & Géologie")
cat22.super_category = cat2
cat22.save
cat23 = SubCategory.new(name: "Géographies")
cat23.super_category = cat2
cat23.save
cat31 = SubCategory.new(name: "Environnements")
cat31.super_category = cat3
cat31.save
cat32 = SubCategory.new(name: "Le Monde Végétal")
cat32.super_category = cat3
cat32.save
cat33 = SubCategory.new(name: "Le Monde Animal")
cat33.super_category = cat3
cat33.save
cat41 = SubCategory.new(name: "Corps Humains")
cat41.super_category = cat4
cat41.save
cat42 = SubCategory.new(name: "Santés")
cat42.super_category = cat4
cat42.save
cat43 = SubCategory.new(name: "Sports")
cat43.super_category = cat4
cat43.save
cat51 = SubCategory.new(name: "Arts")
cat51.super_category = cat5
cat51.save
cat52 = SubCategory.new(name: "Philosophies & social")
cat52.super_category = cat5
cat52.save
cat53 = SubCategory.new(name: "Politiques & Gestions")
cat53.super_category = cat5
cat53.save
cat54 = SubCategory.new(name: "Histoires & Passés")
cat54.super_category = cat5
cat54.save
puts "adding #{SubCategory.all.count} sub categories in db."

puts "creating videos :"
video1 = Video.create!(title: "Le deep learning", youtube_id: "trWrEWfhTVg", duration_seconds: 1207, minimum_age: 14, introduction: true, pro: false, verified: true, description: "Le deep learning, une technique qui révolutionne l'intelligence artificielle...et bientôt notre quotidien !

Le billet qui accompagne la vidéo : http://wp.me/p11Vwl-23E

Mon livre : http://science-etonnante.com/livre.html

Facebook : http://www.facebook.com/sciencetonnante
Twitter : http://www.twitter.com/dlouapre
Tipeee : http://www.tipeee.com/science-etonnante
Abonnez-vous : https://www.youtube.com/user/ScienceE...

La vidéo de Fei Fei Li à TED : https://www.ted.com/talks/fei_fei_li_...

La leçon inaugurale de Yann Le Cun au Collège de France : http://www.college-de-france.fr/site/...

Références :
==========
Russakovsky, Olga, et al. « Imagenet large scale visual recognition challenge. » International Journal of Computer Vision 115.3 (2015): 211-252. http://arxiv.org/pdf/1409.0575

Radford, Alec, Luke Metz, and Soumith Chintala. « Unsupervised Representation Learning with Deep Convolutional Generative Adversarial Networks. » arXiv preprint arXiv:1511.06434 (2015). http://arxiv.org/pdf/1511.06434

Zeiler, Matthew D., and Rob Fergus. « Visualizing and understanding convolutional networks. » Computer vision–ECCV 2014. Springer International Publishing, 2014. 818-833. http://arxiv.org/pdf/1311.2901

Vinyals, Oriol, et al. 'Show and tell: A neural image caption generator.' Proceedings of the IEEE Conference on Computer Vision and Pattern Recognition. 2015.  http://arxiv.org/pdf/1411.4555.pdf
")

video2 = Video.create!(title: "Les ondes gravitationnelles - A chaud", youtube_id: "1WKWEbmaN30", duration_seconds: 1098, minimum_age: 15, introduction: true, pro: false, verified: true, description: "Des ondes gravitationnelles viennent d'être pour la première fois directement détectées. Ça veut dire quoi ? Et comment on a fait ?

Une vidéo à moitié improvisée, pour un nouveau format : 'À chaud !'. N'hésitez pas à me dire ce que vous en pensez !

Facebook : http://www.facebook.com/sciencetonnante
Twitter : http://www.twitter.com/dlouapre
Tipeee : http://www.tipeee.com/science-etonnante
Abonnez-vous : https://www.youtube.com/user/ScienceE...

Une chouette vidéo du CNRS sur le sujet : https://lejournal.cnrs.fr/videos/onde...
")

video3 = Video.create!(title: "Le paradoxe de la morale", youtube_id: "W-GAqomxGmo", duration_seconds: 1163, minimum_age: 16, introduction: true, pro: false, verified: true, description: "Faire preuve de morale correspond souvent à sacrifier ses intérêts personnels. Mais comment de tels actes moraux ont-il pu survivre à la sélection naturelle ? C'est la question que Stéphane Debove, docteur en psychologie évolutionnaire, s'est posé pendant sa thèse.

Retrouvez Stéphane sur tout l'internet mondial !
La main baladeuse : https://www.youtube.com/channel/UC4V8...
Homo Fabulus : https://www.youtube.com/channel/UC-Dm...
Liste des publications scientifiques : http://stephanedebove.net/fr/research...
Blog : http://homofabulus.com/
Café des Sciences : http://cafe-sciences.org/

Facebook : https://www.facebook.com/Science4Allorg/
Twitter : https://twitter.com/science__4__all
Tipeee : https://www.tipeee.com/science4all

Sous-titrez / traduisez la vidéo : http://www.youtube.com/timedtext_vide...
Sous-titres sur les autres vidéos : http://www.youtube.com/timedtext_cs_p...

La démocratie sous l'angle de la théorie des jeux | Playlist Science4All
https://www.youtube.com/playlist?list...

Les origines de la morale | La Tronche en Live
https://www.youtube.com/watch?v=GYtAI...

Les origines de la morale, ma thèse et une FAQ | Homo Fabulus
http://homofabulus.com/les-origines-d...

The Evolutionary Origins of Human Fairness (thèse de Stéphane)
https://tel.archives-ouvertes.fr/tel-...

Nietzsche - Généalogie de la morale | Monsieur Phi
https://www.youtube.com/watch?v=4kRY6...

Nietzsche - La généalogie de la morale | Politikon
https://www.youtube.com/watch?v=-dbDV...

LSE Research on the Evolution of Moral | London School of Economics and Political Science
https://www.youtube.com/watch?v=_3IB0...

Comment sommes-nous devenus moraux | Odile Jacob | N. Baumard (directeur de thèse de Stéphane)
Je t'aide... moi non plus | Vuibert | C. Clavien
L'animal moral | Gallimard | R. Wright
The Righteous Mind | Vintage | Jonathan Haidt
The Selfish Gene (Le gène égoïste) | Oxford University Press | Richard Dawkins
")

video4 = Video.create!(title: "La technique pour connaître vos secrets Facebook", youtube_id: "ArHQDrlJspI", duration_seconds: 306, minimum_age: 11, introduction: true, pro: false, verified: true, description: "Abonnez-vous, c'est pour la science ! http://bit.ly/2kWWZAp
Comment votre profil Facebook peut-il révéler plus d'informations que vous n'en donnez ? Un conseil : choisissez bien vos amis, et attention à ce que vous likez...

Extrait de notre dossier 'Tous connectés', en partenariat avec la Fondation MAIF : https://www.lespritsorcier.org/dossie...

Le site de la CNIL : https://www.cnil.fr/

https://www.lespritsorcier.org/
Youtube : https://www.youtube.com/LEspritSorcie...
Facebook : https://www.facebook.com/EspritSorcier/
Twitter : https://twitter.com/EspritSorcier
Tipeee : https://www.tipeee.com/l-esprit-sorcier

Extrait France 24 : https://youtu.be/5ASaJQj9WkU
Extrait Euronews : https://youtu.be/r07alWfUlWE


Remerciements
Fabrice Crasnier – Expert et formateur en sécurité informatique – SCASSI conseil / Doctorant en intelligence artificielle au laboratoire IRIT – Toulouse
Geoffrey Delcroix – Direction des technologies et de l’innovation, CNIL
Ludovic de Carcouët – Directeur général de Digitemis, spécialiste de sécurité informatique
Patrick Simon – Directeur de Panga, spécialiste des réseaux de données et de la sécurisation des infrastructures
Abdessamad Imine – Chercheur en informatique au laboratoire Loria Nancy-Grand Est
Younes Abid – Doctorant au laboratoire Loria Nancy-Grand Est


Un dossier préparé par : Julie Desriac, Arthur Malterre et Jean Fauquet / Rédaction en chef : Frédéric Courant / Direction artistique et technique : Pascal Léonard / Direction de production : Joël Guillemet / Assistant de production : Patrick Berger / Prise de vue et montage : Bertrand Groc, Arthur Malterre, Arthur Francius / Voix : Valérie Guerlain, Jean-Baptiste Puech / Mixage : Pascal Stevens / Relation presse et partenariat : Josselin Aubrée / Graphisme et animations : Christophe Pernoud – BROTHERMAN Productions, Adrien Neto / Web design : Olivier Hamon - VO Productions, Antoine Chérel - ATALANTA / Gestion réseaux sociaux et intégration : Florent Chevallier


© L’Esprit Sorcier - Mars 2018
")

video5 = Video.create!(title: "Les APIs pour débutants", youtube_id: "0FQ6w4CO5Nw", duration_seconds: 3838, minimum_age: 18, introduction: true, pro: true, verified: true, description: "Les APIs sont légions sur le web et offrent simplement et rapidement la possibilité de démultiplier la force de vos applications. De la définition de l'acronyme en passant par la notion de webhook et quelques exemples d'utilisations, Sébastien Saunier, CTO du Wagon, vous invite à découvrir les bases de ce nouvel enjeu stratégique pour votre projet.
Le blog post tuto: http://bit.ly/1uYDsCO
Les slides de Sébastien: http://bit.ly/1yKQjrm
Le meetup: http://bit.ly/1zqvcgm

---

Le Wagon est le premier Bootcamp français dédié à la formation des entrepreneurs au code.

Programme FullStack
http://bit.ly/1yrkUpc

Le Wagon On-Demand
http://bit.ly/1b93Qjy

Inscrivez-vous à notre newsletter
http://bit.ly/11KQINA

Tous nos événements sur Meetup
http://bit.ly/1BIRO9k

Suivez-nous sur Facebook & Twitter pour plus de ressources http://on.fb.me/1vK5NeE
http://bit.ly/1nu9PFn!
")

video6 = Video.create!(title: "Débuter avec Git et GitHub", youtube_id: "V6Zo68uQPqE", duration_seconds: 5228, minimum_age: 18, introduction: true, pro: true, verified: true, description: "Les curieux que vous êtes avez sûrement entendu parler de Github, un réseau social un peu différent de Facebook où ça parle de code. Github est basé sur git, un utilitaire développé par le créateur de Linux, et qui joue un rôle central dans tout projet de développement : celui de système de gestion des versions. Maîtriser git, c'est adopter une bonne pratique de développement qui changera à jamais votre vision de l'Informatique.

En 2h, nous allons installer git, créer un premier dépôt, et nous initier à la manipulation de versions de fichiers. Nous verrons ensuite le système de branches et introduirons la notion de flux de travail. Une fois les bases acquises, nous créerons un compte Github, et commencerons à collaborer. Pour finir, nous utiliserons le service Github Pages pour déployer notre premier site Internet via git !

---

Le Wagon est le premier Bootcamp français dédié à la formation des entrepreneurs au code.

Programme FullStack
http://bit.ly/1yrkUpc

Le Wagon On-Demand
http://bit.ly/1b93Qjy

Inscrivez-vous à notre newsletter
http://bit.ly/11KQINA

Tous nos événements sur Meetup
http://bit.ly/1BIRO9k

Suivez-nous sur Facebook & Twitter pour plus de ressources http://on.fb.me/1vK5NeE
http://bit.ly/1nu9PFn!
")

puts "adding #{Video.all.count} videos in db."

puts "creating tag (video_category relation) :"
puts "create tag for #{video1.title}"
  tag1 = VideoCategory.new
    tag1.video = video1
    tag1.sub_category = cat11
    tag1.relevance = 90
    tag1.save

  tag2 = VideoCategory.new
    tag2.video = video1
    tag2.sub_category = cat52
    tag2.relevance = 10
    tag2.save

puts "create tag for #{video2.title}"
  tag3 = VideoCategory.new
    tag3.video = video2
    tag3.sub_category = cat11
    tag3.relevance = 20
    tag3.save

  tag4 = VideoCategory.new
    tag4.video = video2
    tag4.sub_category = cat13
    tag4.relevance = 40
    tag4.save

  tag5 = VideoCategory.new
    tag5.video = video2
    tag5.sub_category = cat21
    tag5.relevance = 40
    tag5.save

puts "create tag for #{video3.title}"
  tag6 = VideoCategory.new
    tag6.video = video3
    tag6.sub_category = cat52
    tag6.relevance = 80
    tag6.save

  tag7 = VideoCategory.new
    tag7.video = video3
    tag7.sub_category = cat53
    tag7.relevance = 20
    tag7.save

puts "create tag for #{video4.title}"
  tag8 = VideoCategory.new
    tag8.video = video4
    tag8.sub_category = cat11
    tag8.relevance = 60
    tag8.save

  tag9 = VideoCategory.new
    tag9.video = video4
    tag9.sub_category = cat52
    tag9.relevance = 40
    tag9.save

puts "create tag for #{video5.title}"
  tag10 = VideoCategory.new
    tag10.video = video5
    tag10.sub_category = cat11
    tag10.relevance = 100
    tag10.save

puts "create tag for #{video6.title}"
  tag11 = VideoCategory.new
    tag11.video = video6
    tag11.sub_category = cat11
    tag11.relevance = 100
    tag11.save

puts "adding #{VideoCategory.all.count} tags in db."

# require 'open-uri'
# require 'nokogiri'

# for i in (1..2)
#   html_content = open("http://www.cafe-sciences.org/videosciences/page/#{i}").read
#   doc = Nokogiri::HTML(html_content)

#   doc.search('.entry-title a').each do |element|
#     if /^https:\/\/www.youtube.com\/watch\?v=.{11}$/.match(element['href'])

#       yt_id = element['href'][-11, 11]
#       p yt_id
#       video = Yt::Video.new id: yt_id
#       p Video.create!(title: video.title, youtube_id: yt_id, duration_seconds: video.duration, minimum_age: 14, description: video.description)

#     end
#   end
# end
