import { LazyLoadImage } from "react-lazy-load-image-component";
import { CSSProperties, Fragment } from "react";

import styles from "../styles/Home.page.module.scss";

import Navbar from "../components/Navbar";
import homeCharacter from "../images/home-character.png";

import "react-lazy-load-image-component/src/effects/opacity.css";

function Home() {
  return (
    <Fragment>
      <>
        <div
          className="lightEffect"
          style={
            {
              left: "10vh",
              bottom: "-10vh",
              "--effectColor": "#2c12bb99",
            } as CSSProperties
          }
        ></div>
        <div
          className="lightEffect"
          style={
            {
              left: "-10vh",
              bottom: "10vh",
              "--effectColor": "#53e2ec99",
            } as CSSProperties
          }
        ></div>

        <div
          className="lightEffect"
          style={
            {
              right: "10vh",
              top: "-10vh",
              "--effectColor": "#2c12bb99",
            } as CSSProperties
          }
        ></div>
        <div
          className="lightEffect"
          style={
            {
              right: "-10vh",
              top: "10vh",
              "--effectColor": "#53e2ec99",
            } as CSSProperties
          }
        ></div>
      </>
      <Navbar />

      <div className={styles.wrapper}>
        <div className={styles.hero}>
          <LazyLoadImage effect="opacity" src={homeCharacter} />
          <div className={styles.heroText}>
            <h1>You can get rich too!</h1>
            <p>
              Because of our new games with every game you play you get more
              close to being rich! What are you waiting for? Hop on and play
              some games
            </p>
          </div>
        </div>
      </div>
    </Fragment>
  );
}

export default Home;
