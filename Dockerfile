# contains/write inside this file the instruction and dependcies 
# of how the app work and need to work and run
# ازاي بيشغلي الابلبكشين 
# the out of this file is considered a container
# 1== this file almost start with s bsde image, means the thing my app need depencies
# الحاجة اللي هتديني ال ديبندسيز اللي التطبيق بتاعي محتاجها
# زي النود جي اس مثلا 
# FROM baseImage
FROM node 
# we can specify the version node:
# but the base image will be the latest


# 3 == رجعت هنا تاني عشان انفذ الخطوة التنظيم 
WORKDIR /app

# 2== after that node will be installed inside the contaier
# بعد كدا محتاج انقل الابليكيشن بتاعي جوا السيرفر واحمله الحاجات اللي هو عايزها
# COPY source dest
# source => package.json the depen. my app need to run
# dest=> is the container
COPY package.json .
# يعني انقلي الملفف الباكج للكونتينر
# ممكن بدل ال دوت اكتب / app

# note=> بس قبل الخطوة دي المفروض كنت نظمت الكونتينر يعني اعمل فولدر لحط فيه الفايلز دي
# فهرجع تاني خطوة قبل السطر الفات علشان اعمل دا 
# WORKDIR /app




# 4=> بعد كدا خلاص هحتاج احمل ال باكجس من الفايل اللي التطبيق بتاعي محتاجها

# RUN npm install

# ممكن حد يسأل هو انا امتي عرفت ال 
# npm 
# هقولك في الأول خالص أول ما حملت النود

# 4.2 => new update of the way of installtiion
# based on the environment
ARG NODE_ENV
RUN if [ "$NODE_ENV" = "production"]; \
    then npm install --only=production;\
    else npm install;\
    fi


# 5== طيب انا كدا حملت ورفعت وطبطت وعرفت
# كل الحاجات والباكج اللي التطبيق بتاعي محتاجها
# طيب فين السورس كود بقي والشغل بتاعي أصلا 
# هقولك سهل جدا جدا
COPY /src .
# زي قبل كدا برده قولنا . ممكن نخليها / آب

# طيب فرضنا مشروعي كبير فهحتاج اني اضيف كل الملفات 
# هقولك بسيططة ممكن تعمل كدا
# Copy . .


EXPOSE 4000


# 6 == 
# كدا خلاص وأخيرا هحتاج إني أرن المشروع بتاعي
CMD [ "npm","run","start-dev" ]

# 7=> 
# ممكن احتاج اعمل خطوة قبل ال 6
# وهو اني اعمل expose
# بمعني محتاج اكلم التطبيق اللي جوا الكونتينر دا واديله بورت 
# وليكن 4000 زي اللي كنت مديه للسيرفر
# EXPOSE 4000


# finally,
# انا برن الفايل دا علشان اطلع منه 
# image
# وبعد كدا اطلع منه 
# Container
# by using
# docker build ./Dockerfile or .
# لازم ادي ال image 
# اللي هتطلع اسم عشان لو عندي كتير فهعمل دا ازاي في الترمينال
# docker build -t express-node-app .

# بعد كدا لما تتم الهملية بنجاح
# واحتجت تعرض كل الصور اللي انشأتها يمكنك استخدام في الترمينال
# docker image ls

# يمكنني استخدام ال image
# عشان ارن منه كونتينر باستخدام
# docker run express-node-app
# طبعا كل دا في الترمينال
# حاول تديه اسم برده عشان لربما يكون عند اكتر من كونتينر
# docker run --name express-node-app-container express-node-app
# بعد كدا لما الدنيا هتشتغل هيجبلك الترمينال بتاعت الكونتينر علشان كدا حاول تحط
# فلاج -d
# علشان متجبلكش الترمينال بتاعت الكونتينر 
# docker run --name express-node-app-container -d express-node-app

# هيطلعلك ارور علشان لما رنيت نفس الكود تاني قالك انه
# بالفعل الكونتينر لسه موجود
# علشان كد لازم تمسح الكونتينر اللي فات
# docker rm express-node-app -f

# علشان تعرض كل الكونتينر اللي شغالة حاليا
# docker ps

# بعد كدا تقدر تكلم الكونتينر علي البراوزر باستخدام بورت 4000

# هتلاقي ارور حصل علشان انت مش عارف توصل للبورت بالرغم من اننا كاتبين 
# بورت 4000 علشان دا زي ماقولنا ماهو الا دكومنتيشن
# والكونتينر بتاعنا ايزوليتيد فمحتاجين نعمل فورورد للبورت
# docker run --name express-node-app-container -d -p 4000:4000 express-node-app
# يعني كلملي البورت 4000 للي جوا الكونتينر باللي جوا الماشين بتاعتي
# علشان كدا استخدمنا فوروورد للبورت من الماشين بتاعتي
# للماشبن اللي جوا الكونتينر


# --------------------------------------------------------------------------------

# تخيل عايز افتح ترمينال علي الكونتينر بتاعتي 
# عشان ارن منها وكدا خد عندك
# docker exec -it express-node-app-container bash
# يعني يادوكر اكسكيوت وافتحلي باش ترمينال علي الكونتينر بتاعي دا ويكون 
# انتاراكتيف ترمينال
# وبالتالي اقدر استخدم اي أمر وليكن 
# ls
# علشان اعرف الحاجات الموجودة


# علي فكرة 
# COPY . .
# مش كل الملفات هتتنقل ليه 
# يعني انت كدا حتي النوود موجيولز هتنقله ةالدوكر فايل 
# فدي مش
# optimize
# فهعمل ملف اسمه
# .dockerignore


# --------------------------
  # ع فكرة فرضنا حبيت تعمل ران باستخدام نودمون لعمل ووتش للوجز يمكنك استخدام
  # CMD ["npm","run","start-dev"]

  # وكمان علشان تعمل ووتش وتقدر تشوف ال أوتبوت وانت مشغل الكونتينر يمكنك استخدام
  # docker log express-node-app-conainer

  # ع فكرة باستخدام الطريقة دي مش هتقدر تعمل كدا علشان حتي 
  # مع استخدام نوودمون مش هتقدر تعمل اوتو ريلود لإني دا يعتبر تغيير
  # في الكود في اللوكال ماشين فهتضطر كل مرة تعمل 
  # صورة جديدة ودا مش عملي علشان كدا لجأنا ل 
  # ال HotReload by values
  # علشان كل التغييرات تحصل وتسمع ع طوول من غير مااعمل صورة جديدة ليه 
  # اصلا بغمل صورة جديدة علشان اصلا لما جيت نسخت في الاول الملفات اتحفظت عندي 
  # فهعمل الطريقة دي علشان اعمل سينك ويسمع تلقائي
  # باستخدام فلاج جديد 
  # -v + copy full path not relative path + the other destination i need to sync with it 
  # بمعني المسار الاول اللي هو الكود بتاعي والتاني اللي هو الفولدر اللي محتاج
  # اعمل معاه سينك ويسمع كل التغييرات اللي هو ال 
  # /app


  # مش هيشتغل عندك ال هوت ريلود ع فكرة فلاززم تعمل دا
  # solution: in package.json in script section change
# "start-dev": "nodemon index.js" 
# to 
# "start-dev": "nodemon --legacy-watch index.js"

# windows 11 & docker desktop

# ---------------------------------------------
  # ممكن دا يعمل مشكلة اني عملية ال 
  # sunc between the two, my local and the container
  # each time i delete a file from a container it delete also from my local machine
  # so we come to this solution below
  # instead we make a two way binding we will create a one way binding
  # to listen from my local to the container only

  # docker run --name express-node-app-container -v D:\My_Github_Projects\docker:/app:ro -d -p 4000:4000 express-node-app
  # ro means read only for the container changes
  # ممكن تختصر الباث بتاع الفولدر الحالي للمشروع باستخدام
  # ${pwd} for mac and linux
  # %cd% for windows

  # ------------------------------------
    # docker volume
    # anoth solution for the below problem
    # after we made one way binding if you delete any file for ex:
      # nodemodules this will produce an error for the installed packages so this
      # is not normal 
      # so we go to volume
      # anonymous volumes
        # docker run --name express-node-app-container -v D:\My_Github_Projects\docker:/app:ro -v /app/node_modules -d -p 4000:4000 express-node-app
        # يعني متقرببش لأي تغيير يحصل في النوود موديولز
        # أنا اصلا كدا كدا مش محتاج اني اعمل سينك غير للكود نفسه علشان كدا
        # docker run --name express-node-app-container -v D:\My_Github_Projects\docker/src:/app/src:ro -d -p 4000:4000 express-node-app


# ----------------------------------------------------------
  # docker compose important for more containers, services, easy use
  # go to docker-compose.yml
  # --------------------------------------------------------------