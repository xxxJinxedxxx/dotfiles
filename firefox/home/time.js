function realtimeClock() {

    var clockerhehe = new Date();
    var hrs = clockerhehe.getHours();
    var mins = clockerhehe.getMinutes();
    var secs = clockerhehe.getSeconds();

    hrs = ("0" + hrs).slice(-2);
    mins = ("0" + mins).slice(-2);
    secs = ("0" + secs).slice(-2);

    var jours = ["Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi"];
    var mois = ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"];

    var jourSemaine = jours[clockerhehe.getDay()];
    var jour = clockerhehe.getDate();
    var moisNom = mois[clockerhehe.getMonth()];
    var annee = clockerhehe.getFullYear();

    document.getElementById('date').innerHTML = jourSemaine + " " + jour + " " + moisNom + " " + annee;
    document.getElementById('clock').innerHTML = hrs + ":" + mins + ":" + secs;
    var t = setTimeout(realtimeClock, 500);
}
