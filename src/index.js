const allDropdownContainer = document.querySelector('.all-dropdown-container');
const allRows = document.querySelectorAll('.subcategory-container');
const content = document.querySelector('.page-content');

const closeAll = () => {
	[...allRows].map((e) => {
		e.classList.add('invisible');
		e.style.display = 'none';
	});
};

allDropdownContainer.addEventListener('click', closeAll);
content.addEventListener('click', closeAll);

const handleRowClick = (element, event) => {
	const buttonClasses = event.composedPath()[0].classList;

	//console.log(buttonClasses);

	if (buttonClasses.contains('list-opener')) {
		const subCatContainer = element.querySelector('.subcategory-container');
		if (subCatContainer.classList.contains('invisible')) {
			subCatContainer.classList.remove('invisible');
			subCatContainer.classList.add('open');

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
