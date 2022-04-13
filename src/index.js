const allDropdownContainer = document.querySelector('.all-dropdown-container');
const allRows = document.querySelectorAll('.subcategory-container');
//const content = document.querySelector('.page-content');

var mainCategories = categories.filter(
	(c) => c.layout_code == null && c.body_layout == null
);
var currentCategory = mainCategories.filter((c) => c.b_current == 1)[0];

var mainObj = {};

console.log(categories);

const buildMainObj = (current, source) => {
	var currentAll = [];
	source.map((c) => {
		if (
			c.s_category == current.s_category &&
			c.layout_code != null &&
			c.body_layout != null
		) {
			currentAll.push(c);
		}
	});

	var add = currentAll.filter((c) => c.s_action == 'a0');
	var addCurrent = add.filter((c) => c.b_current == 1)[0];
	add.splice(add.indexOf(addCurrent));

	var edit = currentAll.filter((c) => c.s_action == 'e0');
	var editCurrent = edit.filter((c) => c.b_current == 1)[0];
	edit.splice(edit.indexOf(editCurrent));

	var list = currentAll.filter((c) => c.s_action == 'l0');
	var listCurrent = list.filter((c) => c.b_current == 1)[0];
	list.splice(list.indexOf(listCurrent));

	var tabs = currentAll.filter((c) => c.s_action == 't0');
	var tabsCurrent = tabs.filter((c) => c.b_current == 1)[0];
	tabs.splice(tabs.indexOf(tabsCurrent));

	return {
		add: add,
		addCurrent: addCurrent,
		edit: edit,
		editCurrent: editCurrent,
		list: list,
		listCurrent: listCurrent,
		tabs: tabs,
		tabsCurrent: tabsCurrent,
	};
};

console.log(buildMainObj(currentCategory, categories));

const closeAll = () => {
	[...allRows].map((e) => {
		e.classList.add('invisible');
		e.style.display = 'none';
	});
};

allDropdownContainer.addEventListener('click', closeAll);
//content.addEventListener('click', closeAll);

const handleRowClick = (element, event) => {
	const buttonClasses = event.composedPath()[0].classList;

	/*
	if (buttonClasses.contains('list-opener')) {
		const subCatContainer = element.querySelector('.subcategory-container');
		if (subCatContainer.classList.contains('invisible')) {
			subCatContainer.classList.remove('invisible');
			subCatContayiner.classList.add('open');

			subCatContainer.style.display = 'block';
		} else {
			subCatContainer.classList.remove('open');
			closeAll();
		}
	} else {
		closeAll();
	}
	if (buttonClasses.contains('cat-label-action')) {
		const button = element.querySelector('.label-text').innerText;
		console.log('Category: ' + button);
	} else if (buttonClasses.contains('subcat-item')) {
		if (event.composedPath()[0].tagName !== 'IMG') {
			console.log(
				'Selected subcategory: ' + event.composedPath()[0].innerText.trim()
			);
		} else {
			console.log(
				'Selected subcategory: ' + event.composedPath()[1].innerText.trim()
			);
		}
	}
	*/
};

delegateCategory(
	allDropdownContainer,
	'click',
	'.row-container',
	handleRowClick
);

function delegateCategory(parent, type, selector, handler) {
	parent.addEventListener(type, function (event) {
		const targetElement = event.target.closest(selector);
		if (targetElement == null) return;
		targetElement.addEventListener(type, handleRowClick(targetElement, event));
		//if (this.contains(targetElement)) handler.call(targetElement, event);
	});
}
