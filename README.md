<h3>Table of Contents</h3>
<dl>
<dt>
<a href="#le-cine">1. Le Cine</a>
</dt>
<dd>
<a href="#tech-specs" style="marginLeft: 50px">1.a Tech Specs</a>
</dd>
<dd>
<a href="#installation">1.b Installation Instructions</a>
</dd>
<dt>
<a href="#why">2. Why?</a>
</dt>
<dt>
<a href="database">3. Database Relationships</a>
</dt>
<dt>
<a href="future-goals">4. Future Goals</a>
</dt>
</dl>

<h1>Le Cine</h1>
A film club management app to bring meaningful conversation and film lovers together under one roof.

<h2>Tech Specs</h2>

- Ruby version - 2.6.1
- Database - PostgreSQL

<h2>Installation Instructions</h2>

- Run `bundle install`
- Run `rails db:create`
- Run `rails db:migrate`
- Run `rails db:seed`
- Start the frontend server, you can find those installations instructions <a href="https://github.com/abeciana1/le-cine-frontend">here</a>.
- Navigate to the "Signup" page to create your own account

<h1 id="why">Why?</h1>
Since the start of the pandemic, like many of us, I found myself with less of a social life. In the early days, when most wouldn’t dare step outside of their homes, people needed to find ways to entertain themselves while in quarantine.
<br />
<br />
Although we have to socially distance, it didn't mean we couldn't expand digital forms of socializing. Thankfully, my friend Russell found this as an opportunity to create a safe escape once a week in the form of the Pandemic Film Club. We have all cultivated a lasting friendship that spans across the country.
<br />
<br />
Films have always been a way to fantasize and escape from reality for a short amount of time. The creation of a film club does not only provide an opportunity for people to watch a film, it allows them to analyze, discuss, and share ideas with other people. For instance, in my friend Russell's Pandemic Film Club, we take turns hosting themed double-features. The preparation and homework each week gives that night's host something to look at, read, and interact with in a creative environment. The discussion questions for the "homework" film forces us to take our minds away from the pandemic and into something constructive. The "watchalong" film is a chance for us to share a movie that can be enjoyed and discussed afterwards.


<h1 id="database">Database Relationships</h1>

You can view my SQL database diagram <a href="https://drawsql.app/alex-beciana/diagrams/film-club-core" alt="Le Cine Database Diagrams">here</a>.

<h1 id="future-goals">Future Goals</h1>

- Add an image upload field to user signup and club creation forms
- Add a SMS push notification feature that allows hosts to send messages to members about the club
- Add a email notification that will send an email that looks like the meeting show page to members
- Add CMS to allow users to create their own review articles
- Add Trackt API to lookup film's streaming platform and link
