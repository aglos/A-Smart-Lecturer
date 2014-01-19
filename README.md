A-Smart-Lecturer
================

<div align="right" dir="rtl">
<img src="http://s16.postimg.org/n9008q1et/Owl_logo_03.jpg">

<a href="http://aglosh2014.appspot.com/">Check out the project!</a><br>
<a href="https://github.com/aglos/A-Smart-Lecturer/wiki">A-Smart-Lecturer Wiki </a>


A part of:
jce - Azrieli college jerusalem -a software engineering department project 2013 :
A-Smart-Lecturer


  <h2>By AGLOS team:</h2>
  
  <img src="https://0.gravatar.com/avatar/90689234430e5bf4f910bde4654afc36?d=https%3A%2F%2Fidenticons.github.com%2F6d924fbfc98ec9fb9d6636e4b0df0186.png&r=x&s=440">
  
  <h2>הערה: עקב בעיות סינכרון בענפים השונים. כעת הענף -v working מחזיק את הקוד האחרון</h2>
  <br>
  <h2>סטטוס הפרויקט</h2>
  כרגע יש אתר באוויר המציג את הפונקציונליות של המשתמשים השונים .
  נתקלנו בקשיים במימוש שדה הנתונים והתאמתו למבנה הנתונים הסטטי שיצרנו
  לכן האתר כרגע עובד על מבנה נתונים סטטי אשר עליו ניתן לבצע את הפעולות.
  
  <b>בפועל המצב הינו:</b>
  <ul>
    <li>
    1. <b>עמוד מנהל:</b> קיימים טפסים לניהול משתמשים, קורסים וחוגים. בשעת שליחת הטופס נוצרים האובייקטים הדרושים אך בגלל שאין לנו דיבי דינמי באויר אין לנו איפה לשמור את אותם אובייקטים
    </li>
    <li>
    2. <b>עמוד סטודנט:</b> בעמוד זה אין כתיבה לדיבי אלא רק קריאה - כל שיהיה לעשות הוא לקרוא את נתוני התרגילים מהדיבי הדינמי לאחר שיבנה במקום מהסטטי שקיים כעת.
    </li>
    <li>
    3. <b>עמוד מרצה:</b> בעת הוספת תרגיל חדש יהיה ליצור אובייקט מסוג תרגיל ולעדכן את מערך התרגילים אשר במחלקת הקורסים. מכיון שאין לנו דיבי דינמי אשר הוא מחזיק את הקורסים אין לנו לאן להוסיף תרגילים חדשים. במצב הנוכחי גם כאן קריאה מהדיבי הסטטי.
    </li>
    <li>
    4. <b>עמוד בודק:</b> על הבודק להזין ציונים בשני מצבים: עריכה או הזנה של ציוני תרגיל אשר טרם נבדק. גם כאן לא יכלנו לממש זאת מכיון שהתרגילים מיוצגים כמערך במחלקת הקורסים, והציונים במערך במחלקת הסטודנט.
    </li>
  <li><br><br> חשוב לציין כי עמודים נוספים כגון: עמוד הכניסה, כל הסקריפטים המרוחקים שאנו משתמשים בהם באג'קס לקריאת נתונים והצגתם בצורה דינמי - כולם בעצם שולפים (בלבד) מידע מהדיבי, כרגע מהסטטי. לכן במצב בו יהיה דיבי דינמי נצטרך פשוט להחליף את הקוד בשליפה הדאטהסטור</li>
  </li>
  </ul>
</div>
