import { RiArrowDropDownLine } from "react-icons/ri";

import styles from "../styles/Select.module.scss";
import { CSSProperties, useState } from "react";

import $ from "jquery";

interface IOption {
  name: string;
  value: string;
  selected?: boolean;
}

function Select({
  style,
  options,
  disable = false,
  optionSelected = () => {},
}: {
  style?: CSSProperties;
  disable?: boolean;
  optionSelected?: (opt: IOption) => void;
  options: IOption[];
}) {
  const [internalOptions, setInternalOptions] = useState<IOption[]>(options);
  const [showingOptionsMenu, setShowingOptionsMenu] = useState<boolean>(false);

  const inputClicked = () => {
    if (disable) return;

    setShowingOptionsMenu(!showingOptionsMenu);
  };
  const optionClicked = (clickedOption: IOption) => {
    for (let i = 0; i < internalOptions.length; i++) {
      if (internalOptions[i].name == clickedOption.name) {
        internalOptions[i].selected = true;
      } else delete internalOptions[i]?.selected;
    }

    setInternalOptions(internalOptions.slice());
    optionSelected(clickedOption);
  };

  window.addEventListener("click", (e) => {
    const clickedClass = $(e.target as EventTarget).attr("class");

    if (clickedClass != styles.container) {
      setShowingOptionsMenu(false);
    }
  });

  window.addEventListener("keydown", (e) => {
    if (e.key == "Escape" || e.key == "Backspace") setShowingOptionsMenu(false);
  });

  return (
    <div
      style={{
        cursor: disable ? "not-allowed" : "unset",
        zIndex: showingOptionsMenu ? "" : 1,
        ...style,
      }}
      onClick={inputClicked}
      className={styles.container}
    >
      {internalOptions?.find((x) => x?.selected)?.name || "None"}
      <RiArrowDropDownLine className={styles.dropdownIcon} />

      <div
        style={{
          display: showingOptionsMenu ? "unset" : "none",
        }}
        className={styles.optionsMenu}
      >
        {internalOptions
          ?.filter((x) => !x?.selected)
          ?.map((option, i) => {
            return (
              <div
                key={i}
                onClick={() => {
                  optionClicked(option);
                }}
                data-value={option.value}
                className={styles.option}
              >
                {option.name}
              </div>
            );
          })}
      </div>
    </div>
  );
}

export default Select;
